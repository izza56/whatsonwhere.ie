class CreatePosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.timestamps
      t.text :message
      t.timestamps
      t.belongs_to :event
    end
  end

  add_index :events, :event_id

  def self.down
    drop_table :posts
  end
end
