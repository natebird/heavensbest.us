class Operator::AccountsController < InheritedResources::Base
  layout "operator"

  def index
    @accounts = current_user.accounts
  end
  
  def new
    @account = current_user.accounts.build
    @account.phones.build
    @account.operators.build
  end

  def edit
    @account = Account.find(params[:id])
    @account.phones.build if @account.phones.nil?
    @account.operators.build if @account.operators.nil?
    @current_tab = "settings"
  end
  
  def create    
    if @account.save
      redirect_to operator_accounts_url
    else
      render :action => 'new'
    end
  end

  def update
    if admin?
      @account = Account.find(params[:id])
    else
      @account = current_user.accounts.find(params[:id])
    end

    if @account.update_attributes(params[:account])
      flash[:notice] = 'Area was successfully updated.'
      redirect_to(edit_operator_account_path(@account))
    else
      render :action => "edit"
    end
  end

  def cancel
    load_object
    if request.post? and !params[:confirm].blank?
      @account.destroy
      redirect_to canceled_operator_accounts_url
    end
  end
  
  protected
  
    def scoper
      if admin?
        Account
      else
        current_user.accounts
      end
    end
    
    def redirect_url
      { :action => 'show', :id => @account }
    end
    
    def load_billing
      @creditcard = ActiveMerchant::Billing::CreditCard.new(params[:creditcard])
      @address = SubscriptionAddress.new(params[:address])
    end

    def load_subscription
      load_object
      @subscription = @account.subscription
    end
    
    # def authorize
    #   authenticate_or_request_with_http_basic do |username, password|
    #     username == "admin" && password == "secret"
    #   end
    # end
  
end
