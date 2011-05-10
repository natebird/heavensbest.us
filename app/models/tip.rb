class Tip < ActiveRecord::Base
  
  def self.random
    self.order(APP_CONFIG[:random_query]).first
  end
  
end
