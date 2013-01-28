class Route < ActiveRecord::Base
  attr_accessible :origin, :destination
  validates :origin, :destination, :length => {:is => 3} # IATA airport codes
  validates :origin, :destination, :presence => true

  def self.options_for_routes_select
    all.map do |route|
      [route.text_descriptor, route.text_descriptor]
    end
  end

  def text_descriptor
    "#{origin} - #{destination}"
  end

end
