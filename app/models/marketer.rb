class Marketer < ActiveRecord::Base
  attr_accessible :apikey, :login

  has_and_belongs_to_many :campaigns
end
