class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username

  has_many :interests
  
  # eventually put user's followers and followings
  # and interests



end
