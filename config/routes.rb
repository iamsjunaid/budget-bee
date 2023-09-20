Rails.application.routes.draw do
  devise_for :users
  # resources :categories
  # resources :purchases
  # resources :users
  # resources :purchase_categories

  authenticated :user do
    resources :categories do
      resources :purchases
    end
  end
  # Defines the root path route ("/")
  root "splash#index"
end
