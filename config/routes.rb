Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :transaction_items, only: %i[index create]
  end
end
