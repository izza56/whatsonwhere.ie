class EventInstance < ActiveRecord::Base
  ajaxful_rateable :dimensions => [:quality], :allow_update => true
  has_many :post

  has_one :age_limit
  has_one :genre
  has_one :category

end
