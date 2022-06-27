Rails.application.routes.draw do
  resources :devices
  resources :orders, only: %i[create new show]

  post 'orders' => 'orders#create'
  delete 'orders/:id' => 'orders#destroy'

  devise_for :users

  namespace :admin do
    resources :orders do
      member do
        get :orders
      end
    end
    resources :devices do
      member do
        get   :purge_image
        patch :update_status
        post  :order
      end
      collection do
        delete 'destroy_multiple'
      end
    end
  end

  root 'devices#index'
  get 'index', to: 'devices#index'

  # That's for the future

  # post 'orders/:id/add' => "orders#add_quantity", as: "order_item_add"
  # post 'orders/:id/reduce' => "orders#reduce_quantity", as: "order_item_reduce"
end
