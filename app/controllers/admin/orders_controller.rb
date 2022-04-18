class Admin::OrdersController < Admin::BaseController
  def show
    @order = Order.find(params[:id])
  end

  def index
    @device = Device.paginate(page: params[:page], per_page: 10)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @current_cart.order_items.each do |item|
      @order.order_items << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address)
  end
end

# before_action :set_device, only: %i[show edit update destroy purge_image update_status]

#   def create
#     @device = Device.new(device_params)
#     if @device.valid?
#       @device.save
#       flash[:success] = 'Console was created successfully'
#       redirect_to admin_devices_path
#     else
#       flash[:error] = @device.errors
#       render 'edit'
#     end
#   end

#   def update
#     if @device.update(device_params)
#       flash[:notice] = 'Console was updated successfully.'
#       redirect_to admin_device_url(@device)
#     else
#       render 'edit'
#     end
#   end

#   def edit; end

#   def destroy
#     @device.destroy
#     redirect_to admin_device_path(@device)
#   end

#   private

#   def set_device
#     @device = Device.find(params[:id])
#   end

#   def device_params
#     params.require(:device).permit(:name, :equipment, :description, :price, :image)
#   end

# end
