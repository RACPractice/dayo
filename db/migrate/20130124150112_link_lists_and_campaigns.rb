class LinkListsAndCampaigns < ActiveRecord::Migration
  def up
  	create_table :campaigns_lists, :id => false do |t|
	  t.references :campaign, :null => false
	  t.references :list, :null => false
	end

	# Adding the index can massively speed up join tables. Don't use the
	# unique if you allow duplicates.
	add_index(:campaigns_lists, [:campaign_id, :list_id], :unique => true)
  end

  def down
  end
end
