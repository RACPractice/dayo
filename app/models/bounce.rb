class Bounce < ActiveRecord::Base
  attr_accessible :bounce_type, :date, :reason, :recipient_id, :list_id

  #ACCESSORS
  belongs_to :list
  belongs_to :recipient
end
