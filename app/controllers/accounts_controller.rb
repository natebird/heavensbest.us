class AccountsController < ApplicationController
  
  def index
    @accounts ||= Account.find(:all, :conditions => ['locations LIKE ?', "%#{params[:search]}%"], :limit => 9)
  end
  
  def area_search
    @account = Account.find_by_name(params[:account][:locations])
    redirect_to area_path(@account.region.abbreviation.downcase, @account.accountlink)
  rescue
    redirect_to root_path, :status => 301
    flash[:notice] = "Area not available"    
  end  

  def locations
    # @accounts ||= Account.find(:all, :group => "region_id")
    @accounts = Account.find(:all, :order => "name asc")
    @account_regions = @accounts.group_by { |a| a.region.name }
    @current_tab = "locations"
  end
  
  def show
    @account ||= Account.find_by_accountlink(params[:accountlink])
    @region ||= Region.find_by_abbreviation(params[:region].upcase)
    @testimonial ||= current_account.testimonials.find(:first, :order => APP_CONFIG[:random_query])
    @special ||= current_account.specials.find(:first, :conditions => [ "start <= ? and end >= ?", 
              Date.today, Date.today ], :order => APP_CONFIG[:random_query])
    @services = @account.services.find(:all)
    @current_tab = "home"
    rescue
      redirect_to root_path, :status => 301
      flash[:notice] = "Area not available"    
  end

  protected
      
    def load_subscription
      load_object
      @subscription = @account.subscription
    end
    
end
