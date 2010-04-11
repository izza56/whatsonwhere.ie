class MakeGenreBelongToCategory < ActiveRecord::Migration
  def self.up
    add_column :genres, :category_id, :integer
  end

  def self.down
    remove_column :genres, :category_id
  end
end
