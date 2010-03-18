class Post < ActiveRecord::Base
  ajaxful_rateable :dimensions => [:quality], :allow_update => true
end
