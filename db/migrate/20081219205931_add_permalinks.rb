class AddPermalinks < ActiveRecord::Migration
  def self.up
    add_column :accounts, :accountlink, :string
    add_column :services, :servicelink, :string
  end

  def self.down
    remove_column :accounts, :accountlink, :string
    remove_column :services, :servicelink, :string
  end
end
