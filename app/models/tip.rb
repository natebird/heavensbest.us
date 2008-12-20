class Tip < ActiveRecord::Base
  
  def self.random
    @tip ||= Tip.find(:first, :order => "RAND()")
  end
  
end
