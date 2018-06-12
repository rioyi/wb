module Api
  module V1
    class BookSuggestionsController < ApplicationController
      before_action :authenticate_request, except: %i[index create]
      def index
        @book_suggestions = BookSuggestion.all
        render json: @book_suggestions
      end

      def create
        @book_suggestion = BookSuggestion.new(book_suggestion_params)
        @book_suggestion.user_id = current_user.try(:id)
        if @book_suggestion.save
          render json: @book_suggestion, status: :created
        else
          render json: { errors: @book_suggestion.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def book_suggestion_params
        params.permit(:author, :title, :link, :editorial, :price, :publisher, :year)
      end
    end
  end
end
