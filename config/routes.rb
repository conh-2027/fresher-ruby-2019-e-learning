Rails.application.routes.draw do
  namespace :admin do
    get "/", to: "base#index"
  end
  root "static_pages#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  resources :users
end
