class AddPhotoToService < ActiveRecord::Migration
  def self.up
    add_column :services, :photo_id, :integer
  end

  def self.down
    remove_column :services, :photo_id, :integer
  end
end
