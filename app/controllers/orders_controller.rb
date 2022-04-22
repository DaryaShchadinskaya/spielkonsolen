class OrdersController < ApplicationController
  def create
    @order = Order.create(device: @device)
    #  binding.pry
    redirect_to orders_path
  end

  def show
    @order = Order.find(params[:id])
    @device = @order.device
  end

  # def destroy
  #   # @order_item = OrderItem.find(params[:id])
  #   device.destroy
  #   redirect_to order_path(@order)
  # end

  # privat

  # def order_params
  #   params.require(:order).permit(:device_id, :quantity)
  # end
end
