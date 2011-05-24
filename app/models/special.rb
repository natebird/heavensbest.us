class Special < ActiveRecord::Base
  belongs_to :account
  
  validates :title, :length => { :maximum => 22 }, :message => "needs to be less than {{count}} characters"
  validates :title, :presence => true
  validates :phone, :presence => true, :message => "number can't be blank"
  
  def self.random
    @special ||= Special.order(APP_CONFIG[:random_query]).first
  end
  
end
