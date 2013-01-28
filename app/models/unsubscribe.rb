class Unsubscribe < ActiveRecord::Base
  attr_accessible :date, :list_id, :recipient_id

  #ACCESSORS
  belongs_to :list
  belongs_to :recipient
end
