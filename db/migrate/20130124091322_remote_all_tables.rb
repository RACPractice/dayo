class RemoteAllTables < ActiveRecord::Migration
  def up
  	drop_table :campaigns
  	drop_table :campaigns_consumers
  	drop_table :campaigns_templates
  	drop_table :templates
  	drop_table :marketers_campaigns
  	drop_table :marketers
  	drop_table :consumers
  end

  def down
  end
end
