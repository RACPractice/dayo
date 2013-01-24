class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :title
      t.string :unsubscribe_link
      t.string :unsubscribe_settings
      t.boolean :confim_option
      t.string :confirmation_success_page
      t.string :list_identifier
      t.references :user, :null => false

      t.timestamps
    end

    add_index :lists, :user_id
    add_index :lists, :title
    add_index :lists, :unsubscribe_link
  end
end
