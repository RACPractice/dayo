class AddIndexesToCampaignsAndTemplates < ActiveRecord::Migration
  def change
  	add_index :campaigns, :name
  	add_index :campaigns, :user_id
  	add_index :templates, :campaign_id
  	add_index :templates, :name
  	add_index :templates, :user_id
  end
end
