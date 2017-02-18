class ArticleSerializer < ActiveModel::Serializer
  # this isn't being used currently
  attributes :id, :title, :description, :link, :source, :author, :image_url, :date
  has_many :users

end
