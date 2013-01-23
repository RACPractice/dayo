class Campaign < ActiveRecord::Base
  attr_accessible :name, :origin, :destination, :base_airlines, :comparative_airline, :advance_days, :length_of_stay, :score

  #has_and_belongs_to_many :marketers
  #has_and_belongs_to_many :templates
  #has_and_belongs_to_many :consumers
end
