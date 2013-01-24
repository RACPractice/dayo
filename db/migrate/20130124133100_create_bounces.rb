class CreateBounces < ActiveRecord::Migration
  def change
    create_table :bounces do |t|
      t.string :bounce_type
      t.datetime :date
      t.string :reason
      t.references :recipient
      t.references :list

      t.timestamps
    end

    add_index :bounces, :recipient_id
    add_index :bounces, :list_id
  end
end
