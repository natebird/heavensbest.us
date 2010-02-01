class User < ActiveRecord::Base
  
  acts_as_authentic do |c|
      c.act_like_restful_authentication = true
  end
  
  # Validations
  validates_presence_of :login
  validates_length_of :login, :within => 3..40
  validates_uniqueness_of :login, :case_sensitive => false
  validates_length_of :name, :maximum => 100
  validates_presence_of :email
  validates_length_of :email, :within => 6..100
  validates_uniqueness_of :email, :case_sensitive => false
  
  # Relationships
  has_many :accounts
  has_and_belongs_to_many :roles

  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :phone, :name, :password, :password_confirmation, :identity_url

  # Check if a user has a role.
  def has_role?(role)
    list ||= self.roles.map(&:name)
    list.include?(role.to_s) || list.include?('admin')
  end
  
  protected
    
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    UserMailer.deliver_password_reset_instructions(self)  
  end
  
end
