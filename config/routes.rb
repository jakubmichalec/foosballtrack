Rails.application.routes.draw do
  devise_for :users
  root 'players#index'

  resources :players, except: [:edit, :update, :destroy]
  resources :matches, except: [:edit, :update, :destroy]
end
