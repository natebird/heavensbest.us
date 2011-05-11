class AccountsController < ApplicationController
  
  def index
    @accounts ||= Account.where("locations LIKE ? OR zip_codes LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").limit(7)
  end
  
  def search
    @account = Account.find_by_name(params[:account][:locations])
    redirect_to area_path(@account.region.abbreviation.downcase, @account.accountlink)
  rescue
    flash[:notice] = "Area not found"    
    render :action => :index, :status => :not_found  
  end  

  def locations
    # @accounts ||= Account.find(:all, :group => "region_id")
    @accounts = Account.order("name asc")
    @account_regions = @accounts.includes(:region).group_by { |a| a.region.name }
    @current_tab = "locations"
  end
  
  def show
    @account ||= Account.find_by_accountlink(params[:accountlink])
    redirect_to_external if @account.externalsite.present?
    @region ||= Region.find_by_abbreviation(params[:region].upcase)
    @testimonial ||= current_account.testimonials.order(APP_CONFIG[:random_query]).first
    @special ||= current_account.specials.where("start <= ? and end >= ?", Date.today, Date.today).order(APP_CONFIG[:random_query]).first
    @services = @account.services
    @current_tab = "home"
  end

  protected
      
    def load_subscription
      load_object
      @subscription = @account.subscription
    end

    def redirect_to_external
      redirect_to @account.externalsite, :status=>301
    end
    
end
