class Route < ActiveRecord::Base
  attr_accessible :origin, :destination
  validates :origin, :destination, :length => {:is => 3} # IATA airport codes
  validates :origin, :destination, :presence => true 
end
