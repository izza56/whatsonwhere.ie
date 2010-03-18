class Genre < ActiveRecord::Base

  has_many :event_instances
end
