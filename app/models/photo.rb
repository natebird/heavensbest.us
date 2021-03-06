class Photo < ActiveRecord::Base
  has_many :services
  
  has_attached_file :image, :url => "/system/:attachment/:id_:style.:extension",
                            :path => ":rails_root/public/system/:attachment/:id_:style.:extension"
  
end
