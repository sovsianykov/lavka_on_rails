Rails.application.routes.draw do
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
        end
      end
    end
  end
end
