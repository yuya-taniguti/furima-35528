Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :history_addresses, only:[:index, :create]
  end
end
