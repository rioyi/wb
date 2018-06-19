Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: 'sidekiq'
  get 'welcome/index'
  root 'welcome#index'
  
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/google_oauth2/callback', to: 'welcome#login'
  get 'auth/failure', to: redirect('/')
  get 'home', to: 'home#show'
  get 'me', to: 'me#show', as: 'me'

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
