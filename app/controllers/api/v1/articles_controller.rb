module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        # @user = current_user
        user = User.find(1)
        #combine user's interests' articles + user's friends' liked articles
        @articles_by_interest = user.interests.collect {|interest| interest.articles}.flatten.uniq
        @articles_by_friends_likes = user.friends.collect {|friend| friend.articles}.flatten.uniq
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
