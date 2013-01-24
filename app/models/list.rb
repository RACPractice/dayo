class List < ActiveRecord::Base
  attr_accessible :confim_option, :confirmation_success_page, :list_identifier, :title, :unsubscribe_link, :unsubscribe_settings

  #ASSOCATIONS
  has_many :recipients
  has_many :bounces
  has_many :unsubscibes
  has_many :complains
end
