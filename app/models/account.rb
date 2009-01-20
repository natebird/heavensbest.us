class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :region
  has_one :subscription, :dependent => :destroy
  has_many :subscription_payments
  has_many :phones, :attributes => true
  has_many :operators, :attributes => true, :discard_if => :blank?
  has_many :services
  has_many :specials
  has_many :testimonials
  
  has_permalink :name, :accountlink
  
  validates_uniqueness_of :name
  validates_presence_of :name, :email, :street, :city, :region_id, :postal_code, :locations
  # validates_acceptance_of :accept

  validate_on_create :valid_plan?
  # validate_on_create :valid_payment_info?
  validate_on_create :valid_subscription?
    
  after_create :seed_data
  
  # attr_accessible :name, :plan, :plan_start, :creditcard, :address
  attr_accessor :plan, :plan_start, :creditcard, :address
  
  acts_as_paranoid
  
  Limits = {
    # 'special_limit' => Proc.new {|a| a.specials.count }
  }
  
  def self.to_dropdown
    all(:order => 'name').collect {|s| [s.name, s.id]}
  end

  def to_s
    name
  end
  
  Limits.each do |name, meth|
    define_method("reached_#{name}?") do
      return false unless self.subscription
      self.subscription.send(name) && self.subscription.send(name) <= meth.call(self)
    end
  end
  
  def needs_payment_info?
    if new_record?
      APP_CONFIG[:require_payment_info_for_trials] && @plan && @plan.amount > 0
    else
      self.subscription.needs_payment_info?
    end
  end
  
  # Does the account qualify for a particular subscription plan based on the plan's limits
  def qualifies_for?(plan)
    Subscription::Limits.keys.collect {|rule| rule.call(self, plan) }.all?
  end
  
  def active?
    self.subscription.next_renewal_at >= Time.now
  end
  
  protected
  
    def valid_payment_info?
      if needs_payment_info?
        unless @creditcard && @creditcard.valid?
          errors.add_to_base("Invalid payment information")
        end
        
        unless @address && @address.valid?
          errors.add_to_base("Invalid address")
        end
      end
    end
    
    def valid_plan?
      errors.add_to_base("Invalid plan selected.") unless @plan
    end
    
    def valid_subscription?
      return if errors.any? # Don't bother with a subscription if there are errors already
      self.build_subscription(:plan => @plan, :next_renewal_at => @plan_start, :creditcard => @creditcard, :address => @address)
      if !subscription.valid?
        errors.add_to_base("Error with payment: #{subscription.errors.full_messages.to_sentence}")
        return false
      end
    end
    
    # # called after validations and after the account has been persisted to the database
    def seed_data
      # background it in case it is slow
      # spawn do 
        # call the background script you have and pass in the account id
        populate_defaults (self.id)
      # end
    end
    
end
