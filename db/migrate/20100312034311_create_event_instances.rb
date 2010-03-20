class CreateEventInstances < ActiveRecord::Migration
  def self.up
    create_table :event_instances do |t|
      t.datetime :start
      t.datetime :end
      t.string :notes
      t.decimal :ticketPrice
      t.decimal :doorPrice
<<<<<<< HEAD
      t.bool :hasDoorSales

=======
      t.integer :genre_id
>>>>>>> 9969a3d6964c79fbb67cbad780a18d568b1b51c0
      t.timestamps
    end
  end

  def self.down
    drop_table :event_instances
  end
end
