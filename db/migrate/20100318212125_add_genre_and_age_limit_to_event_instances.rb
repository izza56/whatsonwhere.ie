class AddGenreAndAgeLimitToEventInstances < ActiveRecord::Migration
  def self.up
    add_column :event_instances, :age_limit_id, :integer
    add_column :event_instances, :genre_id, :integer
  end

  def self.down
    remove_column :event_instances, :genre_id
    remove_column :event_instances, :age_limit_id
  end
end
