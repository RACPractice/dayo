class Timezone < ActiveRecord::Base
  attr_accessible :name

  #ASSOCIATIONS
  has_many :accounts
  has_many :users
end
