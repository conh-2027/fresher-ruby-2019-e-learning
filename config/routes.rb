Rails.application.routes.draw do
  namespace :admin do
    get "/", to: "base#index"
  end
end
