require 'rails_helper'

RSpec.describe Api::V1::BookSuggestionsController, type: :controller do
  describe 'Create a booksuggestion' do
    context '#create' do
      let!(:attrs) { attributes_for(:book_suggestion) }
      it 'add a new booksuggestion' do
        post :create, format: :json
        expect do
          post :create, format: :json, params: attrs
        end.to change(BookSuggestion, :count).by(1)
      end

      it 'responds with created' do
        post :create, format: :json, params: attrs
        expect(response).to have_http_status(:created)
      end

      it 'responds with unprocessable_entity' do
        post :create, format: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
