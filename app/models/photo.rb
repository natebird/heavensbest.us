class Photo < ActiveRecord::Base
  has_many :services
  
  has_attached_file :image
end
