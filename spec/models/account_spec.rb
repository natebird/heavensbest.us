require File.dirname(__FILE__) + '/../spec_helper'
include ActiveMerchant::Billing

describe Account do
  before(:each) do
    @account = accounts(:localhost)
    @plan = subscription_plans(:basic)
    APP_CONFIG[:require_payment_info_for_trials] = true
  end
  
  it "should require payment info when being created with a paid plan when the app configuration requires it" do
    @account = Account.new(:plan => @plan)
    @account.needs_payment_info?.should be_true
  end
  
  it "should not require payment info when being created with a paid plan when the app configuration does not require it" do
    APP_CONFIG[:require_payment_info_for_trials] = false
    @account = Account.new(:plan => @plan)
    @account.needs_payment_info?.should be_false
  end
  
  it "should not require payment info when being created with free plan" do
    @account = Account.new(:plan => subscription_plans(:free))
    @account.needs_payment_info?.should be_false
  end
  
  it "should be invalid without valid payment and address info with a paid plan" do
    @account = Account.new(:plan => @plan)
    @account.valid?.should be_false
    @account.errors.full_messages.should include("Invalid payment information")
    @account.errors.full_messages.should include("Invalid address")
  end
  
  it "should create the subscription when created" do
    lambda do
      @account = Account.create(:plan => subscription_plans(:free))
    end.should change(Subscription, :count)
    Subscription.find(:first, :order => 'id desc').account.should == @account
  end
  
  it "should delegate needs_payment_info? to subscription for existing accounts" do
    @account.subscription.expects(:needs_payment_info?)
    @account.needs_payment_info?
  end
  
  describe "when being created with payment info" do
    before(:each) do
      @account = users(:one).accounts.build(:plan => @plan, :creditcard => @card = CreditCard.new(valid_card), :address => @address = SubscriptionAddress.new(valid_address))
      @account.expects(:build_subscription).with(:plan => @plan, :next_renewal_at => nil, :creditcard => @card, :address => @address).returns(@account.subscription = @subscription = Subscription.new(:plan => @plan, :creditcard => @card, :address => @address))
      @subscription.stubs(:gateway).returns(@gw = BogusGateway.new)
      
      SubscriptionNotifier.stubs(:deliver_welcome).returns(true)
    end
    
    it "should store the CC info with BrainTree and create the account" do
      lambda do
        @account.save.should be_true
      end.should change(Account, :count)
      Account.find(:first, :order => 'id desc').should == @account
    end
    
    it "should create the subscription" do
      lambda do
        @account.save.should be_true
      end.should change(Subscription, :count)
      Subscription.find(:first, :order => 'id desc').account.should == @account
    end
    
    it "should report errors when failing to store the CC info with BrainTree" do
      @subscription.expects(:valid?).returns(false)
      @subscription.errors.expects(:full_messages).returns(["Forced failure"])
      lambda do
         @account.save.should be_false
      end.should_not change(Account, :count)
      @account.errors.full_messages.should == ["Error with payment: Forced failure"]
    end
  
    it "should log the initial billing, if needed" do
      @gw.stubs(:purchase).returns(BogusResponse.new(true, 'Success'))
      @plan.update_attribute(:trial_period, nil)
      lambda do
        @account.save.should be_true
      end.should change(SubscriptionPayment, :count)
      (@sp = SubscriptionPayment.find(:first, :order => 'id desc')).account.should == @account
      @sp.subscription.should == @account.subscription
    end
  end
  
end