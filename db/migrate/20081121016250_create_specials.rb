class CreateSpecials < ActiveRecord::Migration
  def self.up
    create_table :specials do |t|
      t.string :title
      t.string :phone
      t.text :body
      t.references :account
      t.date :start, :end
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :specials
  end
end
