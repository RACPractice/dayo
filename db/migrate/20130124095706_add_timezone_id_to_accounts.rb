class AddTimezoneIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :timezone_id, :integer
    add_index :accounts, :timezone_id
  end
end
