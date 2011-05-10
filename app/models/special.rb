class Special < ActiveRecord::Base
  belongs_to :account
  
  validates_length_of :title, :maximum => 22, :message => "needs to be less than {{count}} characters"
  validates_presence_of :title
  validates_presence_of :phone, :message => "number can't be blank"
  
  def self.random
    @special ||= Special.order(APP_CONFIG[:random_query]).first
  end
  
end
