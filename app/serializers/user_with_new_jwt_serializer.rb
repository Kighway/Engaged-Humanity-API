class UserWithNewJwtSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :profile_url, :jwt


  has_many :interests
  has_many :followers
  has_many :followings

  def jwt
    Auth.encrypt({userid: object.id})
  end



end
