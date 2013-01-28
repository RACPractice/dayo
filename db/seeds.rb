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


