class EventInstance < ActiveRecord::Base
  belongs_to :age_limit
  belongs_to :genre
  ajaxful_rateable :dimensions => [:quality], :allow_update => true
  has_many :post
end
