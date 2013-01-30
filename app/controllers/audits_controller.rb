class AuditsController < ApplicationController

  #class  ::Audited::Adapters::ActiveRecord::Audit
  #  default_scope(order('created_at DESC'))
  #end

  def index
    Audited::Adapters::ActiveRecord::Audit.send(:with_exclusive_scope) do
      # Work around a stupid default_scope in Audited
      @audits = Audited::Adapters::ActiveRecord::Audit.order('created_at DESC').paginate(:page => params[:page], :per_page => 15)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @audits }
    end
  end
end
