module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        user = active_user
        render json: user, serializer: UserFeedSerializer
      end

      def show
        @article = Article.find(params[:id])
        render json: @article
      end

      def like_article
        article_id = params[:id].to_i
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
        is_liked = !!user.likes.find_by(article_id: article_id)

#        render json: {userId: user.id, articleId: article_id, isLiked: is_liked}
        render json: user.article_ids

      end

      def create

        article = Article.find_by(url: params[:url])

        if article
          if !active_user.article_ids.include? article.id
            active_user.articles << article
          end
        else
          new_article = Article.create(create_article_params)

          interest = Interest.find_by(title: params[:interests])

          if !interest
            interest = Interest.create(title: params[:interests])
          end

          new_article.interests << interest

          active_user.articles << new_article
        end

        render json: active_user.article_ids


      end

      private

      def create_article_params
        params.permit(:url, :title, :description, :source, :author, :image_url, :date)
      end


    end
  end



end
