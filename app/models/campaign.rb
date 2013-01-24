class Campaign < ActiveRecord::Base
  attr_accessible :from_email, :from_name, :html_url, :name, :reply_to, :subject, :text_url, :user_id

  #ASSOCIATIONS
  belongs_to :user
  has_many :templates
  has_and_belongs_to_many :schedules
end
