class CreateModelsCategoriesJoinTable < ActiveRecord::Migration
  def up
    create_table :marketers_campaigns, :id => false do |t|
      t.integer :marketer_id
      t.integer :campaign_id
    end
  end

  def down
    drop_table :marketers_campaigns
  end
end
