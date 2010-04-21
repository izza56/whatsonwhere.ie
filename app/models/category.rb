class Category < ActiveRecord::Base
  has_many :genre
end
