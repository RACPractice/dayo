class CreateDsssPackages < ActiveRecord::Migration
  def change
    create_table :dsss_packages do |t|
      t.integer :campaign_id
      t.integer :route_id
      t.string :base_airlines
      t.string :comparative_airlines
      t.integer :advance_days
      t.integer :length_of_stay
      t.datetime :published_at
      t.string :publish_status_code

      t.timestamps
    end
  end
end
