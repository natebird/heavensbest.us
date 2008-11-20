class CreatePhones < ActiveRecord::Migration
  def self.up
    create_table :phones do |t|
      t.integer :number
      t.references :account

      t.timestamps
    end
  end

  def self.down
    drop_table :phones
  end
end
