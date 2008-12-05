class CreateTickets < ActiveRecord::Migration
  def self.up
    create_table :tickets do |t|
      t.references :user
      t.string :name
      t.string :status
      t.string :priority
      t.text :comment
      t.timestamps
    end
  end

  def self.down
    drop_table :tickets
  end
end
