class Tip < ActiveRecord::Base
  belongs_to :area
  
  def self.random
    @tip ||= Tip.find(:first, :order => "RANDOM()")
  end
  
end
