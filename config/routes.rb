Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :articles
  resources :items, only: [:new, :create]
  resources :item, only: [:index, :create]
end
