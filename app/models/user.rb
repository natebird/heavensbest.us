class User < ActiveRecord::Base

  devise :database_authenticatable, :omniauthable, :recoverable, :rememberable, :validatable,
         :confirmable, :encryptable, :encryptor => :restful_authentication_sha1
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  # Relationships
  has_many :accounts
  has_and_belongs_to_many :roles
  
  def has_role?(role)
    list ||= self.roles.map(&:name)
    list.include?(role.to_s) || list.include?('admin')
  end
  
end
