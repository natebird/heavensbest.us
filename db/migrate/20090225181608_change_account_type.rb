class ChangeAccountType < ActiveRecord::Migration
  def self.up
    change_column :accounts, :locations, :text
  end

  def self.down
    change_column :accounts, :locations, :string
  end
end
