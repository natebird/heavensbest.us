class ServicesController < ApplicationController

  before_filter :get_services_and_region
  
  def index
    redirect_to service_path(@region, @account.accountlink, @services.first.servicelink)
    @current_tab = "services"      
  end


  def show
    @service = @account.services.find_by_servicelink(params[:servicelink])
    redirect_to_external if @account.externalsite.present?
    @special ||= @account.specials.where("start <= ? and end >= ?", Date.today, Date.today).order(APP_CONFIG[:random_query]).first
    @testimonial ||= @account.testimonials.order(APP_CONFIG[:random_query]).first
    @current_tab = "services"
    # rescue_from NoMethodError, :with => service_path(@region, @account.accountlink, @services.first.servicelink)
  end  

  private
    def get_services_and_region
      @services = current_account.services.where("active = ?", true)
      @region = @account.region.abbreviation.downcase
    end

    def redirect_to_external
      redirect_to @account.externalsite, :status=>301
    end
end
