Rails.application.routes.draw do
  root 'players#index'

  resources :players, except: [:edit, :update, :destroy]
end
