class CreateBillingDetails < ActiveRecord::Migration
  def change
    create_table :billing_details do |t|
      t.string :credits

      t.timestamps
    end
  end
end
