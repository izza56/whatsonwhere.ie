class EventInstance < ActiveRecord::Base
  belongs_to :age_limit
  belongs_to :genre
end
