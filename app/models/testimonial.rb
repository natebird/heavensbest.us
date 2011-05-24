class Testimonial < ActiveRecord::Base
  belongs_to :account

  validates :quote,     :presence => true
  validates :name,      :presence => true
  validates :location,  :presence => true
    
end
