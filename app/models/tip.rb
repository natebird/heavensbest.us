class Tip < ActiveRecord::Base
  
  def self.random
    self.find(:first, :order => APP_CONFIG[:random_query])
  end
  
end
