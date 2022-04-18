class OrderItemsController < ApplicationController
  def create
    chosen_device = Device.find(params[:device_id])
    current_cart = @current_cart
    @order_item = OrderItem.new
    @order_item.cart = current_cart
    @order_item.device = chosen_device
    @order_item.save
    redirect_to cart_path(current_cart)
  end

  # def create
  #   @order_item = @order.order_items.new(order_params)
  #   @order.save
  #   session[:order_id] = @order.id
  # end

  # def update
  #   @order_item = @order.order_items.find(params[:id])
  #   @order_item.update_attributes(order_params)
  #   @order_items = current_order.order_items
  # end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to cart_path(@current_cart)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :device_id, :cart_id)
  end
end
