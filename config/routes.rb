Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # API Endpoints
  api_version(module: 'api/v1', path: { value: 'api/v1' }, defaults: { format: :json }) do
    resources :users do
      collection do
        resources :sessions, only: [:create] do
          collection do
            post :renew
            post :invalidate_all
          end
        end
      end
    end
    # Resource Book
    resources :books, only: %i[index show]
    resources :book_suggestions, only: %i[index create]
    resources :rents, only: %i[index create]
  end
end
