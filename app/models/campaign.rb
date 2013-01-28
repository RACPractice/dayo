 class Campaign < ActiveRecord::Base
  attr_accessible :from_email, :from_name, :html_url, :name, :reply_to, :subject, :text_url, :user_id, :origin, :destination, :base_airlines, :comparative_airlines, :advance_days, :length_of_stay, :score
  attr_accessible :routes_text, :schedule_text

  #ASSOCIATIONS
  belongs_to :user
  has_many :templates
  has_and_belongs_to_many :routes
  has_and_belongs_to_many :schedules
  has_and_belongs_to_many :lists

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

end
