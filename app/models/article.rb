class Article < ApplicationRecord
  has_many :interests
  has_many :users, :through => :interests

  has_many :likes
  has_many :users, :through => :likes

  has_many :interest_articles
  has_many :interests, :through => :interest_articles


end
