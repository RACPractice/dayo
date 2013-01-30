class AuditsController < ApplicationController

  def index
    @audits = Audited::Adapters::ActiveRecord::Audit.order('created_at DESC').paginate(:page => params[:page], :per_page => 15)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @audits }
    end
  end
end
