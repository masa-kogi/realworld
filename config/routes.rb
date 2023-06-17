Rails.application.routes.draw do
  namespace :api do
    resources :users, only: [:create]
    resources :articles, param: :slug, only: [:show, :create, :update, :destroy]
    post "/users/login", to: "users#login"
  end
end
