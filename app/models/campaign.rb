class Campaign < ActiveRecord::Base
  attr_accessible :description, :isClosed, :name

  has_and_belongs_to_many :marketers
  has_and_belongs_to_many :templates
  has_and_belongs_to_many :consumers
end
