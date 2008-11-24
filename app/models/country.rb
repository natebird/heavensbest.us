class Country < ActiveRecord::Base
  has_many :regions
  has_many :accounts, :through => :regions


  def account_locations
    account.location if account
  end

  def account_locations=(locations)
    self.account = Account.find_by_locations(locations) unless locations.blank?
  end
end
