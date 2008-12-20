class Regions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
      t.string :name
      t.string :abbreviation
      t.integer :country_id

      t.timestamps
    end
  end

  def self.down
    drop_table :regions
  end
end
