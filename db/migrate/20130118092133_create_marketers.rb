class CreateMarketers < ActiveRecord::Migration
  def change
    create_table :marketers do |t|
      t.string :apikey
      t.string :login

      t.timestamps
    end
  end
end
