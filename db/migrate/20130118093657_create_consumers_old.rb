class CreateConsumers < ActiveRecord::Migration
  def change
    create_table :consumers do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :location
      t.string :token

      t.timestamps
    end
  end
end
