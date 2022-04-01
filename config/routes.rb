Rails.application.routes.draw do  
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]  

  namespace :admin do    
    resources :devices do      
      member do
        get :purge_image 
        patch :update_status             
      end       
    end  
  end  
  
  get 'pages/home'
  root to: 'pages#index'
  resources :devices

end
