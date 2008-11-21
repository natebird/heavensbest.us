class CreateTestimonials < ActiveRecord::Migration
  def self.up
    create_table :testimonials do |t|
      t.string :name, :location
      t.text :quote
      t.boolean :active
      t.references :account

      t.timestamps
    end
  end

  def self.down
    drop_table :testimonials
  end
end
