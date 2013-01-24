class Complain < ActiveRecord::Base
  attr_accessible :date, :description

  #ACCESSORS
  belongs_to :list
  belongs_to :recipient
end
