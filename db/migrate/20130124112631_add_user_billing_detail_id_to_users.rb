class AddUserBillingDetailIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :billing_detail_id, :integer
    add_index :users, :billing_detail_id
  end
end
