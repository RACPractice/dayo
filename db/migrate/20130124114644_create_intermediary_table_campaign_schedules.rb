class CreateIntermediaryTableCampaignSchedules < ActiveRecord::Migration
  def up
  	create_table :campaigns_schedules, :id => false do |t|
	  t.references :campaign, :null => false
	  t.references :schedule, :null => false
	end

	# Adding the index can massively speed up join tables. Don't use the
	# unique if you allow duplicates.
	add_index(:campaigns_schedules, [:campaign_id, :schedule_id], :unique => true)
  end

  def down
  end
end
