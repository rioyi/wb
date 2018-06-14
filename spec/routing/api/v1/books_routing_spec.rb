require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :routing do
  describe 'match routing' do
    it 'routes to api/v1/books to books#index' do
      expect(get: 'api/v1/books').to route_to('api/v1/books#index', format: :json)
    end

    it 'routes to api/v1/books/1 to books#show' do
      expect(get: 'api/v1/books/1').to route_to('api/v1/books#show', format: :json, id: '1')
    end
  end
end
