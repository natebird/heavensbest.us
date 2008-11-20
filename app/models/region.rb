class Region < ActiveRecord::Base
  has_many :accounts
  belongs_to :country

end
