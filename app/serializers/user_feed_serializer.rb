class UserFeedSerializer < ActiveModel::Serializer
  attributes :by_followings_likes, :by_interests

  def by_interests
    object.interests.each.with_object({}) do |interest, hash|
      interest.articles.each do |article|
        if hash["#{article.id}"]
          hash["#{article.id}"]['interests'] << { id: interest.id }
        else
          hash["#{article.id}"] = {article: article, liked: !!object.likes.find_by(article_id: article.id)}
          hash["#{article.id}"]['interests'] = []
          hash["#{article.id}"]['interests'] << { id: interest.id, interest_name: interest.title }
        end
      end
    end
  end

  def by_followings_likes

    object.followings.each.with_object({}) do |following, hash|
      following.articles.each do |article|
        if hash["#{article.id}"]
          hash["#{article.id}"]['followings'] << { id: following.id, name: following.first_name}
        else
          hash["#{article.id}"] = {article: article, liked: !!object.likes.find_by(article_id: article.id)}
          hash["#{article.id}"]['followings'] = []
          hash["#{article.id}"]['followings'] << { id: following.id, name: following.first_name}
        end
      end
    end
  end

end
