class Admin::DevicesController < Admin::BaseController
  before_action :set_device, only: [:show, :edit, :update, :destroy, :purge_image]

  def show          
  end

  def new
    @device = Device.new
  end

  def index
    @device = Device.paginate(page: params[:page], per_page: 10)
    if params[:search]
      @devices = Device.search(params[:search]).order("created_at DESC")
    else
      @devices = Device.all.order('created_at DESC')
    end
  end

  def update_status
    @device = Device.find(params[:id])
    if params[:status].present? && Device::STATUSES.include?(params[:status].to_sym)
      @device.update(status: params[:status])
    else
    redirect_to admin_device_url(@device), notice: "Status updated to #{@device.status}"
    end
  end

  def create
    @device = Device.new(device_params)  
    if @device.valid?
      @device.save
      flash[:success] = "Console was created successfully"
      redirect_to admin_devices_path
    else
      flash[:error] = @device.errors
      render 'edit'
    end
  end

  def update
    if @device.update(device_params)
      flash[:notice] = "Console was updated successfully."
      redirect_to admin_device_url(@device)
    else
      render 'edit'
    end
  end

  def edit
    @device = Device.find(params[:id])  
  end

  def purge_image
    @device = Device.find(params[:id])
    @device.image.purge
    redirect_back fallback_location: admin_devices_path, notice: "Success"
  end

  
  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to admin_device_path(@device)
  end

  def delete_image_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge_later
    redirect_back(fallback_location: admin_devices_path)
  end

  private

  def set_device
    @device = Device.find(params[:id])
  end

  def device_params
    params.require(:device).permit(:name, :equipment, :description, :price, :image)
  end

  def image
    ActiveStorage::Attached::One.new('image', Device.find(id), dependent: :purge_later)
  end
end


