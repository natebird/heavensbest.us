class Operator::AccountsController < ApplicationController
  layout "operator"
  include ModelControllerMethods
  
  before_filter :load_billing, :only => [ :new, :create, :billing, :paypal ]
  before_filter :load_subscription, :only => [ :billing, :plan, :paypal ]
  
  ssl_required :billing, :cancel, :new, :create
  ssl_allowed :plans, :canceled, :paypal
  
  def new
    @account = current_user.accounts.build
    @account.phones.build
    @account.operators.build
  end

  def edit
    @account.phones.build if @account.phones.blank?
    @account.operators.build if @account.operators.blank?
  end
  
  def create
    if @account.needs_payment_info?
      @address.first_name = @creditcard.first_name
      @address.last_name = @creditcard.last_name
      @account.address = @address
      @account.creditcard = @creditcard
    end
    @account.plan = SubscriptionPlan.find(params[:plan_id])
    
    if @account.save
      redirect_to redirect_url
    else
      render :action => 'new'
    end
  end
  
  def update
    @account = current_user.accounts.find(params[:id])

    if @account.update_attributes(params[:account])
      flash[:notice] = 'Area was successfully updated.'
      redirect_to(edit_operator_account_url(@account))
    else
      format.html { render :action => "edit" }
    end
  end

  def billing
    if request.post?
      if params[:paypal].blank?
        @address.first_name = @creditcard.first_name
        @address.last_name = @creditcard.last_name
        if @creditcard.valid? & @address.valid?
          if @subscription.store_card(@creditcard, :billing_address => @address.to_activemerchant, :ip => request.remote_ip)
            flash[:notice] = "Your billing information has been updated."
            redirect_to :action => "billing"
          end
        end
      else
        if redirect_url = @subscription.start_paypal(paypal_operator_account_url(@account), billing_operator_account_url(@account))
          redirect_to redirect_url
        end
      end
    end
  end
  
  # Handle the redirect return from PayPal
  def paypal
    if params[:token]
      if @subscription.complete_paypal(params[:token])
        flash[:notice] = 'Your billing information has been updated'
        redirect_to :action => "billing"
      else
        render :action => 'billing'
      end
    else
      redirect_to :action => "billing"
    end
  end

  def plan
    if request.post?
      @old_plan = @subscription.subscription_plan
      @plan = SubscriptionPlan.find(params[:plan_id])
      if @subscription.update_attributes(:plan => @plan)
        flash[:notice] = "Your subscription has been changed."
        SubscriptionNotifier.deliver_plan_changed(@subscription)
        redirect_to :action => "plan"
      else
        @subscription.plan = @old_plan
      end
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
      current_user.accounts
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
  
end
