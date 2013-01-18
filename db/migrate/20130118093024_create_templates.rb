class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :name
      t.text :content
      t.string :firstName
      t.string :lastName
      t.string :optInKey
      t.string :optOutKey

      t.timestamps
    end
  end
end
