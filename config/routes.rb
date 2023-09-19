Rails.application.routes.draw do
  resources :categories
  resources :purchases
  resources :users

  # Defines the root path route ("/")
  root "splash#index"
end
