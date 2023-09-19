Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :purchases
  resources :users

  # Defines the root path route ("/")
  root "splash#index"
end
