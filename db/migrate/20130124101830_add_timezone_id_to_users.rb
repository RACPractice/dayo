class AddTimezoneIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :timezone_id, :integer
    add_index :users, :timezone_id
  end
end
