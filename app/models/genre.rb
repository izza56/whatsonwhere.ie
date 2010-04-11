class Genre < ActiveRecord::Base

  belongs_to :category
  has_many :event_instances

end
