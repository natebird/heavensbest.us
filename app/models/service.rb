class Service < ActiveRecord::Base
  belongs_to :account
  belongs_to :photo

  has_permalink :title, :servicelink
  
  validates_length_of :title, :maximum=>22, :message=>"less than {{count}} or it won't fit"
  validates_presence_of :photo_id, :body, :title
end
