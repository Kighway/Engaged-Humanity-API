class UsersLimitedSerializer < ActiveModel::CollectionSerializer
  attributes :id, :first_name, :last_name, :username, :profile_url

end
