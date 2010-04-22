class ChangePosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.belongs_to :event_instances
    end
  end

  def self.down
    drop_table :posts
  end
end
