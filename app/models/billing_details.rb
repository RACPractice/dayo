class BillingDetails < ActiveRecord::Base
  attr_accessible :credits

  belongs_to :account
end
