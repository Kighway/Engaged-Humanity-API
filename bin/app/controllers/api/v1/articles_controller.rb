module Api
  module V1
    class ArticlesController < ApplicationController
      def index
        render json: Article.all
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
