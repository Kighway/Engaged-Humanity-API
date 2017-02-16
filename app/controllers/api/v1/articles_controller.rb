module Api
  module V1
    class ArticlesController < ApplicationController
      def index
#         @user = active_user
#        user = User.find(1)


        session_data_jwt = request.headers['HTTP_AUTHORIZATION']

        if session_data_jwt.length == 0

          # send back no articles
          @articles_by_interest = []
          @articles_by_friends_likes = []

        # else if session data is a jwt string
        else
          hat = Auth.decode(session_data_jwt)
          user = User.find(hat["userid"])

          #combine user's interests' articles + user's friends' liked articles
          @articles_by_interest = user.interests.collect {|interest| interest.articles}.flatten.uniq
          @articles_by_friends_likes = user.friends.collect {|friend| friend.articles}.flatten.uniq
        end




#        jwtencrypted = request.headers['HTTP_AUTHORIZATION']

        # {userid: 3}
#        hat = Auth.decode(jwtencrypted)

#        user = User.find(hat["userid"])


#        binding.pry

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
