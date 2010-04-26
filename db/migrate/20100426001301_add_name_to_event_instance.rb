class AddNameToEventInstance < ActiveRecord::Migration
  def self.up
    add_column :event_instances, :name, :string
  end

  def self.down
    remove_column :event_instances, :name
  end
end
