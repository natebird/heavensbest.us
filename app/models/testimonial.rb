class Testimonial < ActiveRecord::Base
  belongs_to :account

  validates_presence_of :quote, :name, :location
    
end
