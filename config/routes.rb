Rails.application.routes.draw do
  namespace :admin do    
    resources :devices do
      member do
        delete :purge_image
      end
    end  
  end
  
  devise_for :users
  root 'devices#index'

end
