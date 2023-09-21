Rails.application.routes.draw do
  devise_for :users
  get 'categories/index'
  authenticated :user do
    resources :categories do
      resources :purchases
    end
  end
  # Defines the root path route ("/")
  root "splash#index"
end
