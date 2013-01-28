# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create some routes in the DB, if they don't exist
[ ['JFK', 'ATL'],
  ['JFK', 'YYZ'],
  ['SFO', 'IAD'],
  ['YYZ', 'BOS'],
  ['JFK', 'LHR']
].each do |pair|
  origin      = pair.first
  destination = pair.second
  unless Route.where("origin = ? AND destination = ?", origin, destination).
               count > 0
    Route.create! :origin      => origin,
                  :destination => destination
  end
end

u = User.find_by_email('silviu.rosu@ness.com')
unless u
  u = User.create! :email => 'silviu.rosu@ness.com', :password => '123456', :password_confirmation => '123456'
end

#add a campaing for reporting
c = Campaign.find_by_name('Trip to Rome')
unless c
  c = Campaign.create! :name => 'Trip to Rome', :from_email => 'rac@ness.com', :from_name => 'NESS',
    :reply_to => 'rac@ness.com', :subject => 'Special offer for trip to Rome', :user_id => u.id,
    :base_airlines => 'TAROM', :comparative_airlines => 'Blueair', :advance_days => 7,
    :length_of_stay => 7, :score => 5
end

unless c.routes.any?
  c.routes << Route.where('origin = ? and destination = ?', 'JFK', 'ATL')
  c.routes << Route.where('origin = ? and destination = ?', 'JFK', 'LHR')
  c.save!
end

#create first template
t = Template.find_by_name('Templater')
unless t
  t = Template.create! :name => 'Templater', :user_id => u.id, :campaign_id => c.id, :content => "As a member of our topbonus Program you have witnessed a large number of innovations with us at topbonus and airberlin over the past few months: our partnership with Etihad Airways and becoming a member of oneworld were important milestones which have enabled us to offer our frequent flyers an even greater range of options and benefits. Today we would like to inform you that there has been a substantial change in the organisational structure of topbonus. You will find full details about this and advice on privacy and data protection in your topbonus Log-in area. You will find the important information about the topbonus Programm here. Best regards, Your topbonus Team"
end
#create first list
l1 = List.find_by_title('Managers')
unless l1
  l1 = List.create! :title => 'Managers', :list_identifier => '123456', :user_id => u.id
  c.lists << l1
  c.save!
end
l2 = List.find_by_title('Clients')
unless l2
  l2 = List.create! :title => 'Clients', :list_identifier => '654321', :user_id => u.id
  c.lists << l2
  c.save!
end

#add few recipients for listing
r = Recipient.find_by_name('Gigel')
unless r
  r = Recipient.create! :name => 'Gigel', :email => "gigel@ness.com", :list_id => l1.id
end
r = Recipient.find_by_name('Maria')
unless r
  r = Recipient.create! :name => 'Maria', :email => "maria@ness.com", :list_id => l1.id
end
r = Recipient.find_by_name('Gheorghe')
unless r
  r = Recipient.create! :name => 'Gheorghe', :email => "gheorghe@ness.com", :list_id => l2.id
end
r = Recipient.find_by_name('Violeta')
unless r
  r = Recipient.create! :name => 'Violeta', :email => "violeta@ness.com", :list_id => l2.id
end

b = Bounce.where('recipient_id =? and bounce_type = ?', r.id, "HARD")
unless b.any?
  b = Bounce.create! :bounce_type => "HARD", :reason => 'NOT FOUND', :recipient_id => r.id, :list_id => l1.id
end
b = Bounce.where('recipient_id =? and bounce_type = ?', r.id, "SOFT")
unless b.any?
  b = Bounce.create! :bounce_type => "SORT", :reason => 'REDIRECT', :recipient_id => r.id, :list_id => l1.id
end

unless l1.complains.any?
  c = Complain.create! :date => Time.now, :description => 'I do not want to receive any emails. I do not have time to read them'
  l1.complains << c
  c = Complain.create! :date => Time.now, :description => 'I am not interested in your offers.'
  l1.complains << c
  l1.save!
end

unless l1.unsubscribes.any?
  u = Unsubscribe.create! :recipient_id => r.id, :list_id => l1.id, :date => Time.now
  l1.unsubscribes << u
  l1.save!
end

if Schedule.count == 0
  Schedule.create! :stating_date => Time.now.in_time_zone.beginning_of_year,
                   :ending_date  => Time.now.in_time_zone.end_of_year,
                   :frequence    => 'DAILY'
  Schedule.create! :stating_date => Time.now.in_time_zone.beginning_of_year,
                   :ending_date  => Time.now.in_time_zone.end_of_year,
                   :frequence    => 'WEEKLY'
end

Campaign.all.each do |campaign|
  # Assign all campaigns to a DAILY schedule
  if campaign.schedules.empty?
    campaign.schedules << Schedule.find_by_frequence('DAILY')
  end
  campaign.save!
end
