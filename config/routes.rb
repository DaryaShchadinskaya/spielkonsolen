Rails.application.routes.draw do  
  resources :order_items
  resources :carts, only: [:show]  
  
  devise_for :users

  namespace :admin do    
    resources :devices do      
      member do
        get :purge_image 
        patch :update_status             
      end       
    end  
  end  
  
  resources :devices
  root 'pages#index'
  get 'index', to: 'pages#index'
  
end
