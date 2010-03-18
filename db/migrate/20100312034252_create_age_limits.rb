class CreateAgeLimits < ActiveRecord::Migration
  def self.up
    create_table :age_limits do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :age_limits
  end
end
