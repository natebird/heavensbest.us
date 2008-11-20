class Accounts < ActiveRecord::Migration
  # Create Accounts Table
  create_table :accounts do |t|
    t.string :name
    t.timestamps
    t.datetime :deleted_at
    t.integer  :subscription_discount_id, :limit => 11
    t.string   :street, :street2, :city, :postal_code
    t.integer  :user_id, :region_id
    t.integer  :country_id, :default => 1
    t.string   :company, :email, :locations, :keywords
  end

  def self.down
    drop_table :accounts
  end
end
