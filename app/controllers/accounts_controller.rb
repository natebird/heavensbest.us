class AccountsController < ApplicationController
  
  def index
    @accounts ||= Account.find(:all, :conditions => ['locations LIKE ?', "%#{params[:search]}%"])
  end
  
  def show
    @account ||= Account.find_by_accountlink(params[:accountlink])
    @region ||= Region.find_by_abbreviation(params[:region].upcase)
    @testimonial ||= current_account.testimonials.find(:first, :order => APP_CONFIG[:random_query])
    @special ||= current_account.specials.find(:first, :conditions => [ "start <= ? and end >= ?", 
              Date.today, Date.today ], :order => APP_CONFIG[:random_query])

    rescue
      redirect_to :action => "index"
  end

  protected
      
    def load_subscription
      load_object
      @subscription = @account.subscription
    end
    
end
