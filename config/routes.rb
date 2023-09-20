Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    resources :categories do
      resources :purchases
    end
  end
  # Defines the root path route ("/")
  root "splash#index"
end
