class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :link, :source, :author, :image_url, :date

  has_many :users

end
