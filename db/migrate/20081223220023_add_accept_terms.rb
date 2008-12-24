class AddAcceptTerms < ActiveRecord::Migration
  def self.up
    add_column :account, :accept, :integer
  end

  def self.down
    drop_column :account, :accept
  end
end
