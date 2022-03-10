class AdminController < ApplicationController
  before_action :set_device, only: [:show, :edit, :update, :destroy]

  def show          
  end

  def new
    @device = Device.new
  end

  def index
    @device = Device.all
  end    
      
  def create
    @device = Device.new(device_params)
    @device.save
    redirect_to admin_index_path
    if @device.save
      flash[:notice] = "Console was created successfully"
      redirect_to admin_index_path
    else
      render 'new'
    end
  end

  def edit
    @device = Device.find(params[:id])  
  end
  
  def update
    if @device.update(device_params)
      flash[:notice] = "Console was updated successfully."
      redirect_to @device
    else
      render 'edit'
    end
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to admin_index_path
  end

  private

  def set_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:name, :complectation, :description, :price)
  end

end
