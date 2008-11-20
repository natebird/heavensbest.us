class Country < ActiveRecord::Base
  has_many :regions
  has_many :accounts, :through => :regions


  def area_locations
    account.location if area
  end

  def area_locations=(locations)
    self.account = Account.find_by_locations(locations) unless locations.blank?
  end
end
