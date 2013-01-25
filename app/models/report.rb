class Report

  attr_accessor :id, :campaign_name, :base_airline, :comparative_airline, :advance_days,
   :length_of_stay, :score, :schedules, :template_name, :list_nr, :recipients_nr, :bounces_nr,
    :complaints_nr, :unsubscribes_nr

  def initialize args
    if args
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end
  end
end
