class Ticket < ActiveRecord::Base
  validates_presence_of :comment
  # validates_numericality_of :account_id, :greater_than => 0, :on => :create, 
  #                           :message => ": Please choose an area from the drop down list" 
  
  def self.to_dropdown
    collect {|s| [s.name, s.id]}
  end

  def to_s
    name
  end

end
