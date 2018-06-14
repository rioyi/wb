require 'rails_helper'

RSpec.describe Api::V1::BookSuggestionsController, type: :controller do
  describe 'POST create' do
    context 'create book_suggestion user is not logged' do
      it 'create book_suggestion' do
        post :create, format: :json
        expect do
          post :create, format: :json, params: FactoryBot.attributes_for(:book_suggestion)
        end.to change(BookSuggestion, :count).by(1)
      end

      it 'responds with 201 status' do
        post :create, format: :json, params: FactoryBot.attributes_for(:book_suggestion)
        expect(response).to have_http_status(:created)
      end

      it 'responds with 422 status' do
        post :create, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
