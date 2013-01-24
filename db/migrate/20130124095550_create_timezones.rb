class CreateTimezones < ActiveRecord::Migration
  def change
    create_table :timezones do |t|
      t.string :name

      t.timestamps
    end
    add_index :timezones, :name
  end
end
