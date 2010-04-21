class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.string :title
      t.varchar :review

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end