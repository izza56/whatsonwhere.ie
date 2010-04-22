class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.belongs_to :event_instances
      t.timestamps
      t.text :message
    end
  end

  def self.down
    drop_table :posts
  end
end
