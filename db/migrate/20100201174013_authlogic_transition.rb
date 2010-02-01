class AuthlogicTransition < ActiveRecord::Migration
  def self.up
    change_column :users, :crypted_password,    :string, :limit => 128, :null => false, :default => ""
    change_column :users, :salt,                :string, :limit => 128, :null => false, :default => ""
    add_column    :users, :persistence_token,   :string, :null => false, :default => ""
    add_column    :users, :single_access_token, :string, :null => false, :default => ""
    add_column    :users, :perishable_token,    :string, :null => false, :default => ""
  end

  def self.down
    change_column :users, :crypted_password, :limit => 40
    change_column :users, :salt, :limit => 40
    remove_column :users, :persistence_token
    remove_column :users, :single_access_token
    remove_column :users, :perishable_token
  end
end
