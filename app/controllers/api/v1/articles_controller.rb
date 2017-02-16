module Api
  module V1
    class ArticlesController < ApplicationController
      def index

        # jwt_from_session = request.headers['HTTP_AUTHORIZATION']
        #
        # if jwt_from_session.length == 0
        #
        #   # send back no articles
        #   @articles_by_interest = []
        #   @articles_by_friends_likes = []
        #
        # # else if session data is a jwt string
        # else
          # can probably delete this:
          # jwt_user_id = Auth.decode(jwt_from_session)
          user = User.find(1)

#          user = active_user




          # get articles that a user is interested in
          @articles_by_interest = user.interests.collect {|interest| interest.articles}.flatten.uniq
          # get articles that a friend has liked
          @articles_by_friends_likes = user.friends.collect {|friend| friend.articles}.flatten.uniq
#        end



        # render json: {articles_by_interest: @articles_by_interest, articles_by_friends_likes: @articles_by_friends_likes}

        # @articles = Article.all
#        render json: @articles_by_friend_likes
        render json: @articles_by_interest


      end









      def show
        @article = Article.find(params[:id])
        render json: @article
      end

      def like_article
        article_id = params[:id]
        user = active_user
        # potential place to think about edge cases where someone could make a get request
        # this will return nil if the article isn't found
        # if it is found, it will return the like
        @like = user.likes.find_by(article_id: article_id)
        # if the liked article isn't nil
        if @like
          Like.delete(@like.id)
        else
          Like.create(user_id: user.id, article_id: article_id)
        end
      end




      def create
      end
    end
  end
end
