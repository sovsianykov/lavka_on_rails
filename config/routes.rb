Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :albums do
        resources :tracks, only: [:show]
      end
      resources :tracks 
    end
  end
end
