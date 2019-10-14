Rails.application.routes.draw do

  devise_for :users, controllers: {
    omniauth_callbacks: :omniauth_callbacks
  }
  root controller: :recipes, action: :index
  resources :recipes, only: [:index, :show]
  resources :charges, only: [:new, :create]
  resources :membership, only: [:index, :show]
end