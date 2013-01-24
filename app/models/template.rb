class Template < ActiveRecord::Base
  attr_accessible :campaign_id, :content, :name, :preview_url, :user_id

  #ASSOCIATIONS
  belongs_to :user
  belongs_to :campaign
end
