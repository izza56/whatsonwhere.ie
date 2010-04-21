class AddCategoryToEventInstance < ActiveRecord::Migration
  def self.up
    add_column :event_instances, :category_id, :int
  end

  def self.down
    remove_column :event_instances, :category_id
  end
end
