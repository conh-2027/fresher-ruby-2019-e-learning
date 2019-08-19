Rails.application.routes.draw do
  namespace :admin do
    get "/", to: "base#index"
  end
  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: %i(create destroy)
  resources :account_activations, only: :edit
  resources :password_resets, only: %i(new create edit update)
end
