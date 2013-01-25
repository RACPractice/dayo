class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :origin, :limit => 3
      t.string :destination, :limit => 3

      t.timestamps
    end
  end
end
