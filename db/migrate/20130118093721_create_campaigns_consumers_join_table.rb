class CreateCampaignsConsumersJoinTable < ActiveRecord::Migration
  def up
     create_table :campaigns_consumers, :id => false do |t|
      t.integer :campaign_id
      t.integer :consumer_id
    end
  end

  def down
    drop_table :campaigns_consumers
  end
end
