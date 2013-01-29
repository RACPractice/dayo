class AuditsController < ApplicationController

  def index
    @audits = Audited::Adapters::ActiveRecord::Audit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @campaigns }
    end
  end
end
