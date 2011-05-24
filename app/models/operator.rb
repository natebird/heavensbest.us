class Operator < ActiveRecord::Base
  belongs_to :account
  validates_presence_of :name, :title

end
