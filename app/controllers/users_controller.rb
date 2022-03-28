class UsersController < ApplicationController

    def index    
      @device = Device.paginate(page: params[:page], per_page: 10)
    end
  
  end 