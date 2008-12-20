class Tip < ActiveRecord::Base
  
  def self.random
    @tip ||= Tip.find(:first, :order => APP_CONFIG[:random_query])
  end
  
end
