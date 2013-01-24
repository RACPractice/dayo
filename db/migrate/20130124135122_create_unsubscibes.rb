class CreateUnsubscibes < ActiveRecord::Migration
  def change
    create_table :unsubscibes do |t|
      t.datetime :date
      t.references :recipient
      t.references :list

      t.timestamps
    end

    add_index :unsubscibes, :recipient_id
    add_index :unsubscibes, :list_id
  end
end
