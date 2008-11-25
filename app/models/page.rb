class Page < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :permalink
  validates_presence_of :content
    
end
