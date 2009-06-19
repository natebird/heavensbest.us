class ServicesController < ApplicationController

  before_filter :get_services_and_region
  
  def index
    redirect_to service_path(@region, @account.accountlink, @services.first.servicelink)
    @current_tab = "services"      
  end


  def show
    @service = current_account.services.find_by_servicelink(params[:id])
    @special ||= current_account.specials.find(:first, :conditions => [ "start <= ? and end >= ?", 
                 Date.today, Date.today ], :order => APP_CONFIG[:random_query])
    @testimonial ||= current_account.testimonials.find(:first, :order => APP_CONFIG[:random_query])
    @current_tab = "services"
    # rescue_from NoMethodError, :with => service_path(@region, @account.accountlink, @services.first.servicelink)
  end  

  private
    def get_services_and_region
      @services = current_account.services.find(:all, :conditions => [ "active = ?", true ] )
      @region = @account.region.abbreviation.downcase
    end
end
