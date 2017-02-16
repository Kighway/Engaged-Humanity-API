module Api
  module V1
    class ArticlesController < ApplicationController
      def index

        jwt_from_session = request.headers['HTTP_AUTHORIZATION']

        if jwt_from_session.length == 0

          # send back no articles
          @articles_by_interest = []
          @articles_by_friends_likes = []

        # else if session data is a jwt string
        else
          jwt_user_id = Auth.decode(jwt_from_session)
          user = User.find(jwt_user_id["userid"])

          # get articles that a user is interested in
          @articles_by_interest = user.interests.collect {|interest| interest.articles}.flatten.uniq
          # get articles that a friend has liked
          @articles_by_friends_likes = user.friends.collect {|friend| friend.articles}.flatten.uniq
        end

        render json: {articles_by_interest: @articles_by_interest, articles_by_friends_likes: @articles_by_friends_likes}
      end

      def show
        @article = Article.find(params[:id])
        render json: @article
      end

      def create
      end
    end
  end
end
