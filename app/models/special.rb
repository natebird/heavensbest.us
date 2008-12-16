class Special < ActiveRecord::Base
  belongs_to :account
  
  def self.random
    @special ||= Special.find(:first, :order => "RANDOM()")
  end
  
end
