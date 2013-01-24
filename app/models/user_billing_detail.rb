class UserBillingDetail < ActiveRecord::Base
  attr_accessible :base_delivery_rate, :base_design_spam_test_rate, :base_rate_per_recipient, :can_purchase_credits, :client_pays, :credits, :currency, :markup_on_delivery, :markup_on_design_spam_test, :markup_per_recipient, :monthly_scheme

  #ASSOCIATIONS
  belongs_to :user
end
