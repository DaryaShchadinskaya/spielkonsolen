Rails.application.routes.draw do

  namespace :admin do    
    resources :devices
  end
  
  devise_for :users

  root 'devices#index'

end
