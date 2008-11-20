class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :category
      t.string :name
      t.string :permalink
      t.text :content
      t.timestamps
    end
  end
  
  def self.down
    drop_table :pages
  end
end
