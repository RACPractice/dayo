class Bounce < ActiveRecord::Base
  attr_accessible :bounce_type, :date, :reason

  #ACCESSORS
  belongs_to :list
  belongs_to :recipient
end
