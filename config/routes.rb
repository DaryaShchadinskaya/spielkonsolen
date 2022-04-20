Rails.application.routes.draw do
  resources :order_items
  resources :devices
  resources :orders

  devise_for :users

  namespace :admin do
    resources :orders do
      member do
        get :orders
      end
    end
    resources :devices do
      member do
        get :purge_image
        patch :update_status
      end
      collection do
        delete 'destroy_multiple'
      end
    end
  end

  root 'devices#index'
  get 'index', to: 'devices#index'

  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#destroy'

  post 'order_items' => 'order_items#create'
  delete 'order_items/:id' => 'order_items#destroy'

  # That's for the future

  # post 'order_items/:id/add' => "order_items#add_quantity", as: "order_item_add"
  # post 'order_items/:id/reduce' => "order_items#reduce_quantity", as: "order_item_reduce"
end
