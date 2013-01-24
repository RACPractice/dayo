class CreateComplains < ActiveRecord::Migration
  def change
    create_table :complains do |t|
      t.datetime :date
      t.text :description
      t.references :recipient
      t.references :list

      t.timestamps
    end

    add_index :complains, :recipient_id
    add_index :complains, :list_id
  end
end
