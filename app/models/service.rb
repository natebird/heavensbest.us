class Service < ActiveRecord::Base
  belongs_to :account
  belongs_to :photo

  has_friendly_id :servicelink, :use_slug => true, :scope => :account
  
  validates :title,     :length => { :maximum => 28 }#, :message => "less than {{count}} or it won't fit"
  validates :title,     :presence => true
  validates :photo_id,  :presence => true
  validates :body,      :presence => true
end
