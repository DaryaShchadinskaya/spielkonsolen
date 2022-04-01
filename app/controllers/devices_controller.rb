class DevicesController < ApplicationController
  
    def show      
      @device = Device.find(params[:id])    
    end
  
    def index
      @device = Device.paginate(page: params[:page], per_page: 10)
      if params[:search]
        @devices = Device.search(params[:search]).order("created_at DESC")
      else
        @devices = Device.all.order('created_at DESC')
      end
    end
 
  end 
  