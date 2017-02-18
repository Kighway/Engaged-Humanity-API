class UserFeedSerializer < ActiveModel::Serializer
  attributes :by_followings_likes, :by_interests

  def by_interests
    object.interests.each.with_object({}) do |interest, hash|
      interest.articles.each do |article|
        if hash["#{interest.title}"]
          hash["#{interest.title}"]["articles"]["#{article.id}"] = {article: article, liked: !!object.likes.find_by(article_id: article.id)}
        else
          hash["#{interest.title}"] = {interest_title: interest.title}
          hash["#{interest.title}"]["interest_id"] = interest.id
          hash["#{interest.title}"]["articles"] = {}
          hash["#{interest.title}"]["articles"]["#{article.id}"] = {article: article, liked: !!object.likes.find_by(article_id: article.id)}
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
