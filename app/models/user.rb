class User < ApplicationRecord

  has_many :friendships

  has_many :following, :through => :friendships, source: :friend
  has_many :inverse_friendships, :class_name => 'Friendship', foreign_key: "friend_id"

  has_many :followers, through: :inverse_friendships, source: :user

  has_many :likes
  has_many :articles, :through => :likes
  has_many :user_interests
  has_many :interests, :through => :user_interests


  has_secure_password

  # def followers
  #
  #   self.friendships.join
  #
  # end

end
