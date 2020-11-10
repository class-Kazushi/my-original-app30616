Rails.application.routes.draw do
  devise_for :users
  root to: "requests#index"
  resources :requests
end
