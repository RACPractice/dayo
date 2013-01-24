class Unsubscibe < ActiveRecord::Base
  attr_accessible :date

  #ACCESSORS
  belongs_to :list
  belongs_to :recipient
end
