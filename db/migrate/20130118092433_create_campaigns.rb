class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.boolean :isClosed

      t.timestamps
    end
  end
end
