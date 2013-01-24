class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :email
      t.boolean :visited_link, :null => false, :default => false
      t.boolean :spam_complain, :null => false, :default => false
      t.boolean :forwarded, :null => false, :default => false
      t.boolean :liked, :null => false, :default => false
      t.text :mention
      t.integer :list_id

      t.timestamps
    end

    add_index :recipients, :list_id
    add_index :recipients, :name
    add_index :recipients, :email
  end
end
