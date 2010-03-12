class CreateEventInstances < ActiveRecord::Migration
  def self.up
    create_table :event_instances do |t|
      t.datetime :start
      t.datetime :end
      t.string :notes
      t.decimal :ticketPrice
      t.decimal :doorPrice
      t.bool :hasDoorSales

      t.timestamps
    end
  end

  def self.down
    drop_table :event_instances
  end
end
