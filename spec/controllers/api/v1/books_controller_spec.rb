require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'User Authenticated?' do
    context 'when the user is logged' do
      it 'should respond with status: ok' do
        request.headers['Authorization'] = nil
        get :index, format: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when the user is not logged' do
      it 'should respond with status: unauthorized' do
        create(:book)
        request.headers['Authorization'] = nil
        get :show, format: :json, params: { id: 1 }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
