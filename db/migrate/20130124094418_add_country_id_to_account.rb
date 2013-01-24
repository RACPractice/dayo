class AddCountryIdToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :country_id, :integer
    add_index :accounts, :country_id
  end
end
