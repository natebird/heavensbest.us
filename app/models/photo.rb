class Photo < ActiveRecord::Base
  has_many :services
  
  has_attached_file :image, :url => "/system/images/:attachment/:id_:style.:extension",
                            :path => ":rails_root/public/system/images/:attachment/:id_:style.:extension"
  
end
