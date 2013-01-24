class AddBillingDetailsIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :billing_details_id, :integer

    add_index :accounts, :billing_details_id
  end
end
