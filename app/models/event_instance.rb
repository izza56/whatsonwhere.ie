class EventInstance < ActiveRecord::Base
  ajaxful_rateable :dimensions => [:quality], :allow_update => true
  has_many :post

  has_one :age_limit
  has_one :genre
  has_one :category

  # Jack added for implementing acl9 roles plugin http://github.com/be9/acl9
  acts_as_authorization_object

end
