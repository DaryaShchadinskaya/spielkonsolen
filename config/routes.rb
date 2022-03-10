Rails.application.routes.draw do
  devise_for :users

  root 'devices#index'

  resources :admin
  resources :devices
end
