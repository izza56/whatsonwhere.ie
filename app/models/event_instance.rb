class EventInstance < ActiveRecord::Base

  has_one :age_limit
  has_one :genre
  has_one :category

end
