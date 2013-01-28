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

#create first list
l1 = List.find_by_title('Managers')
unless l1
  l1 = List.create! :title => 'Managers', :list_identifier => '123456', :user_id => u.id
end
l2 = List.find_by_title('Clients')
unless l2
  l2 = List.create! :title => 'Clients', :list_identifier => '654321', :user_id => u.id
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
