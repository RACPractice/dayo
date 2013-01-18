class CreateCampaignsTemplatesJoinTable < ActiveRecord::Migration
  def up
     create_table :campaigns_templates, :id => false do |t|
      t.integer :campaign_id
      t.integer :template_id
    end
  end

  def down
    drop_table :campaigns_templates
  end
end
