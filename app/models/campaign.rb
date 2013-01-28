 class Campaign < ActiveRecord::Base
   audited
  attr_accessible :from_email, :from_name, :html_url, :name, :reply_to, :subject, :text_url, :user_id, :origin, :destination, :base_airlines, :comparative_airlines, :advance_days, :length_of_stay, :score
  attr_accessible :routes_text, :schedule_text

  #ASSOCIATIONS
  belongs_to :user
  has_many :templates
  has_and_belongs_to_many :routes
  has_and_belongs_to_many :schedules
  has_and_belongs_to_many :lists

  #VAlidation
  validates :name,  :presence => true, :uniqueness => true
  validates :score, :length => { :minimum => 1 }
  validates :score, :length => { :maximum => 1000 }
  validates :advance_days, :numericality => true
  validates :length_of_stay, :numericality => true


  # Produces a text description of all the routes
  def routes_text
    routes.map { |r| r.text_descriptor }.join("; ")
  end

  # Accepts a string of routes in text form,
  # and populates the routes association
  def routes_text=(v)
    routes.clear
    v.split(/;\s*/).each do |r|
      origin, destination = r.split /\s*-\s*/
      next unless origin.present? && destination.present?
      logger.info "Asked to set origin #{origin} and destination #{destination}"
      route_obj = Route.find_by_origin_and_destination(origin, destination)
      if route_obj.present?
        routes << route_obj
        logger.info "Found Route #{route_obj}"
      else
        logger.warn "Could not find a Route"
      end
    end
  end

  def schedule_text
    if schedules.empty?
      ''
    else
      schedules.first.frequence
    end
  end

  def schedule_text=(v)
    schedules.clear
    sch = Schedule.find_by_frequence(v)
    if sch
      schedules << sch
    end
  end

  def template_name
  	if templates.any?
  		templates.first.name
  	else
  		""
  	end
  end

  def visits_nr
     recipients_visited.count
  end

  def recipients_visited
    Recipient.joins(:list, :list => :campaigns).where('campaigns.id = ?', self.id).where('recipients.visited_link = ?', true)
  end

  def bounces_nr
    campaign_bounces.count
  end

  def campaign_bounces
    Bounce.joins(:list, :list => :campaigns).where('campaigns.id = ?', self.id)
  end

  def unsubscribes_nr

  end

  def campaingn_unsubscribes

  end

end
