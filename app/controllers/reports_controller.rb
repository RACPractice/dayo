class ReportsController < ApplicationController

  def index
    @campaigns_stats = Campaign.all.collect do |c|
      rep = Report.new :id => c.id, :campaign_name => c.name, :base_airline => c.base_airlines, :comparative_airline => c.base_airlines, :advance_days => c.advance_days, :length_of_stay => c.length_of_stay, :score => c.score
      rep.schedules = c.schedules.count
      rep.template_name = c.template_name
      rep.list_nr = c.lists.count
      rep.recipients_nr = c.lists.inject(0) {|sum,l| sum += l.recipients.count}
      rep.bounces_nr = c.lists.inject(0) {|sum,l| sum += l.bounces.count}
      rep.complaints_nr = c.lists.inject(0) {|sum,l| sum += l.complains.count}
      rep.unsubscribes_nr = c.lists.inject(0) {|sum,l| sum += l.unsubscibes.count}
      rep
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campaigns }
    end
  end

  def details
    c = Campaign.find params[:campaign_id]
    rep = Report.new :campaign_name => c.name, :base_airline => c.base_airlines, :comparative_airline => c.base_airlines, :advance_days => c.advance_days, :length_of_stay => c.length_of_stay, :score => c.score

    rep.schedules = c.schedules.count
    rep.template_name = c.template_name
    rep.list_nr = c.lists.count
    rep.recipients_nr = c.lists.inject(0) {|sum,l| sum += l.recipients.count}
    rep.bounces_nr = c.lists.inject(0) {|sum,l| sum += l.bounces.count}
    rep.complaints_nr = c.lists.inject(0) {|sum,l| sum += l.complains.count}
    rep.unsubscribes_nr = c.lists.inject(0) {|sum,l| sum += l.unsubscibes.count}
    @campaign = c
  end
end
