class ReportsController < ApplicationController

  def index
    @campaigns_stats = Campaign.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campaigns }
    end
  end

end
