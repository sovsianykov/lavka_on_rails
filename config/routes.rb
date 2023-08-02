Rails.application.routes.draw do
  resources :bands
  namespace :api do
    namespace :v1 do
      resources :albums do
        resources :tracks, only: [:show]
      end
      resources :tracks, only: :index do
        collection do
          get :popular
          get :unpopular
          get :info
          get :show_quantity 
        end
      end
      resources :bands
    end
  end
end
