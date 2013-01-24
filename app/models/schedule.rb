class Schedule < ActiveRecord::Base
  attr_accessible :ending_date, :frequence, :stating_date

  #ASSOCIATIONS
  has_and_belongs_to_many :campaigns
end
