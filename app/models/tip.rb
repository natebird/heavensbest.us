class Tip < ActiveRecord::Base
  
  def self.random
    @tip ||= Tip.find(:first, :order => "RANDOM()")
  end
  
end
