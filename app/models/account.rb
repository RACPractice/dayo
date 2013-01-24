class Account < ActiveRecord::Base
  attr_accessible :description, :login

  #ASSOCIATIONS
  has_one :billing_detail
  has_many :users
  belongs_to :country
  belongs_to :timezone
end
