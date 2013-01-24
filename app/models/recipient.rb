class Recipient < ActiveRecord::Base
  attr_accessible :email, :forwarded, :liked, :list_id, :mention, :name, :spam_complain, :visited_link

  #ASSOCIATIONS
  belongs_to: list
end
