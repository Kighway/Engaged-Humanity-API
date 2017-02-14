module Api
  module V1
    class LikesController < ApplicationController
      def index
        render json: Like.all
      end

      def show
        @like = Like.find(params[:id])
        render json: @like
      end

      def create
      end
    end
  end
end
