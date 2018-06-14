module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_request

      def index
        @rent = Rent.all
        render json: @rent, status: :ok
      end

      def create
        @rent = Rent.new(rent_params)
        @rent.user_id = current_user.id
        if @rent.save
          render json: @rent, status: :created
        else
          render json: { errors: @rent.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def rent_params
        params.permit(:user_id, :book_id, :from, :to)
      end
    end
  end
end
