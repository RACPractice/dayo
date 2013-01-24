class CreateUserBillingDetails < ActiveRecord::Migration
  def change
    create_table :user_billing_details do |t|
      t.boolean :can_purchase_credits
      t.integer :credits
      t.float :markup_on_design_spam_test
      t.boolean :client_pays
      t.float :base_rate_per_recipient
      t.float :markup_per_recipient
      t.float :markup_on_delivery
      t.float :base_delivery_rate
      t.string :currency
      t.float :base_design_spam_test_rate
      t.string :monthly_scheme

      t.timestamps
    end
  end
end
