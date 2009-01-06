class Photo < ActiveRecord::Base
  has_many :services
  
  has_attached_file :image, :url => "/images/services/:attachment/:id_:style.:extension",
                            :path => ":rails_root/public/images/services/:attachment/:id_:style.:extension"
  
end
