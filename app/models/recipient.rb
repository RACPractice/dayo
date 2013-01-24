class Recipient < ActiveRecord::Base
  attr_accessible :email, :forwarded, :liked, :list_id, :mention, :name, :spam_complain, :visited_link

  #ASSOCIATIONS
  belongs_to: list
  has_many :bounces
  has_many :unsubscibes
  has_many :complains
end
