module Api
  module V1
    class InterestsController < ApplicationController
      def index
        render json: Interest.all
      end

      def show
        @interest = Interest.find(params[:id])
        render json: @interest
      end

      def create
      end
    end
  end
end
