class DevicesController < ApplicationController

  def show
    @device = Device.find(params[:id])
  end

  def new
    @device = Device.new
  end
  
  def index    
    @device = Device.all
  end    

  # def create
  #   @device = Device.new(device_params)       
  #   if @device.save
  #     flash[:notice] = "Console was created successfully."
  #     redirect_to @device    
  #   end
  # end
  
  private

  def device_params
    params.require(:device).permit(:name, :description, :complectation, :price)
  end

end