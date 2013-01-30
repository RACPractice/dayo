class DsssPackagesController < ApplicationController

  # GET /dsss_packages
  # GET /dsss_packages.json
  def index
    order = 'campaigns.created_at DESC'
    order = "#{params[:sort]} #{params[:direction]}" if params[:sort] && params[:direction]
    @dsss_packages = DsssPackage.joins(:campaign).includes(:campaign).order(order).paginate(:page => params[:page], :per_page => 15)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dsss_packages }
    end
  end

  # POST /dsss_packages/refresh
  def refresh
    DsssPackage.create_from_campaigns!
    respond_to do |format|
      format.html { redirect_to :action => 'index' }
    end
  end

  # POST /dsss_packages/1/publish
  def publish
    @dsss_package = DsssPackage.find(params[:id])
    @dsss_package.publish!
    respond_to do |format|
      format.html { redirect_to :action => 'index' }
    end
  end

  def show
    @dsss_package = DsssPackage.find(params[:id])
    #@recipients = @dsss_package.campaign.lists.inject([]) { |memo, list| memo += list.recipients }
    @recipients = Recipient.all
    @email_template = "default_email_template.html"
    respond_to do |format|
      format.csv
    end
  end

  def destroy
    @dsss_package = DsssPackage.find(params[:id])
    @dsss_package.destroy

    respond_to do |format|
      format.html { redirect_to :action => 'index' }
    end
  end

end
