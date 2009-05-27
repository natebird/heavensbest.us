class GoogleAnalytics < ActiveRecord::Migration
  def self.up
    add_column :accounts, :ganalytics, :string
  end

  def self.down
    drop_column :accounts, :ganalytics
  end
end
