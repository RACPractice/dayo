class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :login
      t.text :description

      t.timestamps
    end

    add_index :accounts, :login,  :unique => true
  end
end
