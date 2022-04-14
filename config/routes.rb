Rails.application.routes.draw do
  resources :order_items
  resources :carts, only: [:show]
  resources :devices
  resources :orders

  devise_for :users

  namespace :admin do
    resources :devices do
      member do
        get :purge_image
        patch :update_status
      end
    end
  end

  root 'pages#index'
  get 'index', to: 'pages#index'

  delete 'carts/:id' => 'carts#destroy'
  post 'order_items' => 'order_items#create'
  delete 'order_items/:id' => 'order_items#destroy'
end
