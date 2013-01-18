class Consumer < ActiveRecord::Base
  attr_accessible :email, :firstName, :lastName, :location, :token

  has_and_belongs_to_many :campaigns
end
