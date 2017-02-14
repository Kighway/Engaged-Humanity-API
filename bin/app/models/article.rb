class Article < ApplicationRecord
  has_many :interests
  has_many :likes, :through => :users
end
