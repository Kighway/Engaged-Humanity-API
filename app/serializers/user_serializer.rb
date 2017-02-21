class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :profile_url, :like_ids

  has_many :interests
  has_many :followers
  has_many :followings


  def like_ids
    object.article_ids
  end

end
