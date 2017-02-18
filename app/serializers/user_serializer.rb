class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username

  has_many :interests
  has_many :followers
  has_many :followings

end
