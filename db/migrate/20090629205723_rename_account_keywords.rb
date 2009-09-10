class RenameAccountKeywords < ActiveRecord::Migration
  def self.up
    rename_column :accounts, :keywords, :zip_codes
  end

  def self.down
    rename_column :accounts, :zip_codes, :keywords
  end
end
