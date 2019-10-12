 Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static_pages#index'
  resources :games do
  resources :bishops, only: [:show, :create, :destroy]
  resources :kings, only: [:show, :create, :destroy]
  resources :knights, only: [:show, :create, :destroy]
  resources :pawns, only: [:show, :create, :destroy]
  resources :queens, only: [:show, :create, :destroy]
  resources :rooks, only: [:show, :create, :destroy]
  end
end
