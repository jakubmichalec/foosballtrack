Rails.application.routes.draw do
  root 'players#index'

  devise_for :users

  resources :players, except: [:edit, :update, :destroy]
  resources :matches, except: [:edit, :update, :destroy]
end
