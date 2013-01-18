class Template < ActiveRecord::Base
  attr_accessible :content, :firstName, :lastName, :name, :optInKey, :optOutKey

  has_and_belongs_to_many :campaigns
end
