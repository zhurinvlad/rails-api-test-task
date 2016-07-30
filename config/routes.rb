Rails.application.routes.draw do
  # constraints subdomain: 'api' do
  scope module: 'api' do
    namespace :v1 do
      get :auth_token, controller: 'api'

      resources :users
      resources :books do
        resources :reviews
      end
      resources :authors do
        resources :books, only: [:index]
      end
    end
  end
  # end
end
