class Service < ActiveRecord::Base
  belongs_to :account
  belongs_to :photo

  has_permalink :title, :servicelink, :scope => :account_id, :update => true
  
  validates_length_of :title, :maximum=>28, :message=>"less than {{count}} or it won't fit"
  validates_presence_of :photo_id, :body, :title
end
