class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :link, :source, :author, :image_url, :date
  has_many :users




  # def players
  #       object.players.collect { |player| [player.name, player.number, player.age]}
  # end
  # def users
  #   Friendship.where(friend_id: active_user.id)
  # end

end
