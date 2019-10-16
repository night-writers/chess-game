 Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static_pages#index'
  resources :games do
    resources :pieces, only: [:show, :update]
  end
end
