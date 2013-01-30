require 'net/ftp'
require 'tempfile'
require 'erb'

class DsssPackage < ActiveRecord::Base
  audited
  attr_accessible :advance_days, :base_airlines, :comparative_airlines, :length_of_stay, :published_at, :publish_status_code

  belongs_to :campaign
  belongs_to :route

  def published?
    published_at.present?
  end

  def self.create_from_campaigns!
    Campaign.all.each do |campaign|
      create_from_campaign!(campaign)
    end
  end

  def self.create_from_campaign!(campaign)
    return if campaign.routes.empty?
    dsss_package = DsssPackage.new :base_airlines        => campaign.base_airlines,
                                   :comparative_airlines => campaign.comparative_airlines,
                                   :advance_days         => campaign.advance_days,
                                   :length_of_stay       => campaign.length_of_stay
    dsss_package.route   = campaign.routes.first
    dsss_package.campaign = campaign
    dsss_package.save!
  end

  def publish!
    @dsss_package = self
    #@recipients = @dsss_package.campaign.lists.inject([]) { |memo, list| memo += list.recipients }
    @recipients = Recipient.all
    @email_template = "default_email_template.html"
    template = File.read("#{Rails.root}/app/views/dsss_packages/show.csv.erb")
    transformed = ERB.new(template, nil, '-').result(binding)
    destination = Tempfile.new("publish")
    destination.write(transformed)
    destination.close
    ftp=Net::FTP.new
    ftp.connect("ftp.drivehq.com",21)
    ftp.login('farecompare', 'farecompare')
    ftp.passive = true
    ftp.putbinaryfile(destination.path, "#{id}.csv")
    ftp.close
    destination.unlink
    update_attributes :published_at        => Time.now.in_time_zone,
                      :publish_status_code => '011'
  rescue
    logger.warn $!.to_s + $!.backtrace.join("\n  ")
    update_attributes :published_at        => Time.now.in_time_zone,
                      :publish_status_code => '042'
  end
end
