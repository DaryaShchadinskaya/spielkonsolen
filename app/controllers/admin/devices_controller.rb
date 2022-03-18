class Admin::DevicesController < Admin::BaseController
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
    if @device.valid?
      flash[:success] = "Console was created successfully"
      redirect_to admin_devices_path(@device)
    else
      flash[:errors] = @device.errors.full_messages
      redirect_to new_admin_device_path(@device)
    end
  end


  def edit
    @device = Device.find(params[:id])  
  end
  
  def update
    if @device.update(device_params)
      flash[:notice] = "Console was updated successfully."
      redirect_to admin_devices_path
    else
      render 'edit'
    end
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to admin_devices_path
  end

  private

  def set_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:name, :complectation, :description, :price, :image)
  end

  def image
    ActiveStorage::Attached::One.new('image', Device.find(id), dependent: :purge_later)
  end
end
