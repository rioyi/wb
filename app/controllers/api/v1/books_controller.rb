module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_book, only: %i[show]
      before_action :authenticate_request

      def index
        @books = Book.all
        render json: @books, status: :ok
      end

      def show
        render json: @book
      end

      private

      def set_book
        @book = Book.find(params[:id])
      rescue StandardError => e
        render json: { errors: e.message }, status: :not_found
      end
    end
  end
end
