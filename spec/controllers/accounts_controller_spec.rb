require File.dirname(__FILE__) + '/../spec_helper'
include ActiveMerchant::Billing

describe AccountsController do
  before(:each) do
    controller.stubs(:current_user).returns(@user)
    @account = @user.accounts.first
  end
  
  it 'should create a new account' do
    @account = Account.new(acct_params = { 'name' => 'Bob' })
    Account.expects(:new).with(acct_params).returns(@account)
    @account.expects(:save).returns(true)
    @account.id = 42
    
    post :create, :account => acct_params, :plan_id => SubscriptionPlan.first.id
    response.should redirect_to(operator_account_url(42))
  end
  
  it "should prep payment and address info when starting to create" do
    get :new
    assigns(:creditcard).should_not be_nil
    assigns(:address).should_not be_nil
  end
  
  describe "with an existing account" do
    before(:each) do
      @user.accounts.expects(:find).with(@account.id.to_s).returns(@account)
    end
    
    it 'should allow updates' do
      @account.expects(:update_attributes).with('name' => 'Foo').returns(true)
      put :update, :id => @account.id, :account => { :name => 'Foo' }
      response.should redirect_to(operator_account_url(@account))
    end

    describe "updating billing info" do
      it "should store the card when it and the address are valid" do
        CreditCard.stubs(:new).returns(@card = mock('CreditCard', :valid? => true, :first_name => 'Bo', :last_name => 'Peep'))
        SubscriptionAddress.stubs(:new).returns(@address = mock('SubscriptionAddress', :valid? => true, :to_activemerchant => 'foo'))
        @address.expects(:first_name=).with('Bo')
        @address.expects(:last_name=).with('Peep')
        @account.subscription.expects(:store_card).with(@card, :billing_address => 'foo', :ip => '0.0.0.0').returns(true)
        post :billing, :id => @account.id, :creditcard => {}, :address => {}      
      end

      describe "with paypal" do
        it "should redirect to paypal to start the process" do
          @account.subscription.expects(:start_paypal).with("http://test.host/areas/#{@account.id}/paypal", "http://test.host/areas/#{@account.id}/billing").returns('http://foo')
          post :billing, :id => @account.id, :paypal => 'true'
          response.should redirect_to('http://foo')
        end

        it "should go nowhere if the paypal token request fails" do
          @account.subscription.expects(:start_paypal).returns(nil)
          post :billing, :id => @account.id, :paypal => 'true'
          response.should render_template('accounts/billing')
        end

        it "should set the subscription info from the paypal response" do
          @account.subscription.expects(:complete_paypal).with('bar').returns(true)
          get :paypal, :id => @account.id, :token => 'bar'
          response.should redirect_to(billing_operator_account_url(@account))
        end

        it "should render the form when encountering problems with the paypal return" do
          @account.subscription.expects(:complete_paypal).with('bar').returns(false)
          get :paypal, :id => @account.id, :token => 'bar'
          response.should render_template('accounts/billing')
        end
      end
    end

    describe "when canceling" do

      it "should not destroy the account without confirmation" do
        @account.expects(:destroy).never
        post :cancel, :id => @account.id
        response.should render_template('cancel')
      end

      it "should destroy the account" do
        @account.expects(:destroy).returns(true)
        post :cancel, :id => @account.id, :confirm => 1
        response.should redirect_to(canceled_accounts_url)
      end
    end
    
  end
end
