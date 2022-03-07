Rails.application.routes.draw do
  devise_for :users

  root 'pages#index'
  #root 'admin#new'

  resources :admin
  resources :devices
end
