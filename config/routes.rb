Rails.application.routes.draw do
  devise_for :users
  root to: "requests#index"
  resources :requests do
    resources :applies, only: [:new, :create]
    resources :supports, only: [:index, :new, :create]
  end
  resources :users, only: :show
end
