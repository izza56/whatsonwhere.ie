class CreateBusinesses < ActiveRecord::Migration
  def self.up
    create_table :businesses do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :province
      t.string :city
      t.string :country
      t.float :longitude
      t.float :lattitude

      t.timestamps
    end
  end

  def self.down
    drop_table :businesses
  end
end
