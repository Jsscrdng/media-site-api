Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :movies, only: :index
      resources :seasons, only: :index
      resources :users, only: [] do
        member do
          post 'purchase', to: 'purchases#create'
          get :library
        end
      end
      get :purchasables, to: 'purchasables#index'
    end
  end
end
