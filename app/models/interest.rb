class Interest < ApplicationRecord
  has_many :articles

  has_many :user_interests
  has_many :users, through: :user_interests

  has_many :interest_articles
  has_many :articles, :through => :interest_articles

end
