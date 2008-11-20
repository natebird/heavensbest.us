class AccountsController < ApplicationController
  # include ModelControllerMethods
  
  auto_complete_for :account, :locations
  
  def index
    @accounts = Account.find(:all)
  end

  def auto_complete_for_account_locations
    @accounts = Account.find(:all, :conditions => ['locations LIKE ?', "%#{params[:search]}%"])
    render :partial => 'accounts'
  end
  
  def show
    # @account = Account.find_by_name(params[:account])
    # @region = Account.region_id.find_by_abbreviation(params[:region])
    # @country = Country.find_by_abbreviation(params[:country])
    @account = Account.find(params[:id])
    # redirect_to :action => "index" unless @account.active?
  end
  

  protected
  
    def redirect_url
      { :action => 'show', :id => @account }
    end
    
    def load_subscription
      load_object
      @subscription = @account.subscription
    end
    
end