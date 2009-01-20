class AddAcceptTerms < ActiveRecord::Migration
  def self.up
    add_column :accounts, :accept, :integer
  end

  def self.down
    drop_column :accounts, :accept
  end
end
