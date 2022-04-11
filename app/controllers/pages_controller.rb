class PagesController < ApplicationController
  before_action :set_device, only: [:show]

  def show          
  end

  def index
    if current_user.admin?
      redirect_to admin_devices_path
    end    
    @device = Device.actual.paginate(page: params[:page], per_page: 10)
    if params[:search]
      @devices = Device.search(params[:search]).order("created_at DESC")
    else
      @devices = Device.all.order('created_at DESC')
    end
  end
  
end 
