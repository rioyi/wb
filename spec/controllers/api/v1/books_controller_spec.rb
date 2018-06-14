require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'
  let!(:book) { create :book }

  describe 'User Authenticated?' do
    context 'when the user is logged' do
      it 'should respond with status: ok in #index' do
        get :index, format: :json
        expect(response).to have_http_status(:ok)
      end

      it 'should respond with status: ok in #show' do
        get :show, format: :json, params: { id: book.id }
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when the user is not logged' do
      let!(:unauthorized) { request.headers['Authorization'] = nil }
      it 'should respond with status: unauthorized in #index' do
        get :index, format: :json
        expect(response).to have_http_status(:unauthorized)
      end

      it 'should respond with status: unauthorized in #show' do
        get :show, format: :json, params: { id: book.id }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
