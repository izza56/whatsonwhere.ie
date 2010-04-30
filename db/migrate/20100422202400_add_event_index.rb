class AddEventIndex < ActiveRecord::Migration
  def self.up
    add_index :event_instances, :id
  end

  def self.down
   # drop_index :event_instances, :id
  end
end
