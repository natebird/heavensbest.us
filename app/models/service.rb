class Service < ActiveRecord::Base
  belongs_to :account
  belongs_to :photo
end
