Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get this route /api/v1/restaurants
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :messages, only: [ :index, :show ]
    end
  end
end
