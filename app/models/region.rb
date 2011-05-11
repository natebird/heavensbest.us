class Region < ActiveRecord::Base
  has_many :accounts
  accepts_nested_attributes_for :accounts, :allow_destroy => false
  
  belongs_to :country

  has_friendly_id :name, :use_slug => true

end
