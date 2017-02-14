class User < ApplicationRecord

  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :articles, :through => :likes


  has_secure_password

end
