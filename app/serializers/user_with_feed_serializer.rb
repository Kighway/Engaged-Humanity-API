class UserWithFeedSerializer < ActiveModel::Serializer
  # attributes :the_current_user, :id, :first_name, :last_name, :username, :articles_by_interests, :articles_by_friends_likes, :interests
  attributes :the_current_user, :articles_by_friends_likes

  has_many :interests
  has_many :friendships

  def the_current_user
    object


  end


  def articles_by_interests
    # get articles that a user is interested in
#    object.interests.collect {|interest| interest.articles}.flatten.uniq
    object.interests.each.with_object({}) do |interest, hash|
      binding.pry
      hash[:articles] = interest.articles
      hash[:articles][:likers] = interest.users
    end

  end

  # class Article < ApplicationRecord
  #   has_many :interests
  #   has_many :users, :through => :interests
  #
  #   has_many :likes
  #   has_many :users, :through => :likes
  #
  #   has_many :interest_articles
  #   has_many :interests, :through => :interest_articles
  #
  #
  # end






  def articles_by_friends_likes
    # object.friends.collect {|friend| friend.articles}.flatten.uniq
    result = object.friends.each.with_object({}) do |friend, hash|
      friend.articles.each do |article|
        if hash["#{article.id}"]
          hash["#{article.id}"]['friend_ids'] << friend.id
        else
          hash["#{article.id}"] = {info: article}
          hash["#{article.id}"]['friend_ids'] = []
          hash["#{article.id}"]['friend_ids'] << friend.id
        end
      end
    end
    result
  end




end
