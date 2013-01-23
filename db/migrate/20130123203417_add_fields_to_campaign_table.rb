class AddFieldsToCampaignTable < ActiveRecord::Migration
  def change
    add_column :campaigns, :origin, :string
    add_column :campaigns, :destination, :string
    add_column :campaigns, :base_airline, :string
    add_column :campaigns, :comparative_airline, :string
    add_column :campaigns, :advance_days, :integer
    add_column :campaigns, :length_of_stay, :integer
    add_column :campaigns, :score, :integer
  end
end
