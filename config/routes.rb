Rails.application.routes.draw do
  devise_for :users
  root to: "requests#index"
  resources :requests
  resources :users, only: :show
end
