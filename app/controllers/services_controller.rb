class ServicesController < ApplicationController

  def index
    @services = current_account.services.find(:all, :conditions => [ "active = ?", true ] )
    @region = @account.region.abbreviation.downcase
    redirect_to service_path(@region, @account.accountlink, @services.first.servicelink)
    rescue
      redirect_to area_path(@account.region.abbreviation.downcase, @account.accountlink)
      flash[:notice] = "No services found"
  end


  def show
    @service = current_account.services.find_by_servicelink(params[:id])
    @services = current_account.services.find(:all, :conditions => [ "active = ?", true ] )
    @special ||= current_account.specials.find(:first, :conditions => [ "start <= ? and end >= ?", 
              Date.today, Date.today ], :order => APP_CONFIG[:random_query])
    @testimonial ||= current_account.testimonials.find(:first, :order => APP_CONFIG[:random_query])
    rescue
      redirect_to area_path(@account.region.abbreviation.downcase, @account.accountlink)
      flash[:notice] = "No services found"
  end
  
  def set_current_tab
    @current_tab = :services
  end
  

end
