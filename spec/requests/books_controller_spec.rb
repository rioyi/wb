require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET index' do
    context 'user login' do
      it('book list #get') do
        FactoryBot.create_list(:book, 5)
        get :index, format: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context 'user witout login' do
      it('status 401') do
        request.headers['Authorization'] = nil
        get :index, format: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
