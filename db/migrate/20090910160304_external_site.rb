class ExternalSite < ActiveRecord::Migration
  def self.up
    add_column :accounts, :externalsite, :string
  end

  def self.down
    drop_column :accounts, :externalsite
  end
end
