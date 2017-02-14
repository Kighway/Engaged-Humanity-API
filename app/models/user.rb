class User < ApplicationRecord

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :likes
  has_many :articles, :through => :likes
  has_many :user_interests
  has_many :interests, :through => :user_interests


  has_secure_password

end
