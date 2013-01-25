class CreateMtmRelationshipWithRoutes < ActiveRecord::Migration
  def change
    create_table "campaigns_routes", :id => false, :force => true do |t|
      t.integer "campaign_id", :null => false
      t.integer "route_id",     :null => false
    end
    # This will delete existing routes!
    remove_column :campaigns, :origin
    remove_column :campaigns, :destination
  end
end
