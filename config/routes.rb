Rails.application.routes.draw do
  namespace :admin do    
    resources :devices do      
      member do
        get :purge_image              
      end       
    end  
  end

  devise_for :users
  root 'admin/devices#index'
  
end
