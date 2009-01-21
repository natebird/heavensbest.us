class ChangePhoneNumberType < ActiveRecord::Migration
  def self.up
    change_column :phones, :number, :string
  end

  def self.down
    change_column :phones, :number, :integer
  end
end
