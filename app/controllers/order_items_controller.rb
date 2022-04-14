class OrderItemsController < ApplicationController
  before_action :set_order

  def create
    @order_item = @order.order_items.new(order_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order_item = @order.order_items.find(params[:id])
    @order_item.update_attributes(order_params)
    @order_items = current_order.order_items
  end

  # def destroy
  #   @order_item = @order.order_items.find(params[:id])
  #   @order_item.destroy
  #   @order_items = current_order.order_items
  # end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    redirect_to cart_path(@current_cart)
  end  


  private

  def order_params
    params.require(:order_item).permit(:device_id, :quantity)
  end

  def set_order
    @order = current_order
  end
end

# def create 
#   chosen_product = Device.find(params[:device_id])
#   current_cart = @current_cart
#   if current_cart.products.include?(chosen_product)
#     @order_item = current_cart.order_items.find_by(product_id: chosen_product)
#     @order_item.quantity += 1
#   else
#     @order_item = OrderItem.new
#     @order_item.cart = current_cart
#     @order_item.product = chosen_product
#   end
#   @order_item.save
#   redirect_to cart_path(current_cart)
# end

# private

# def order_item_params
#   params.require(:order_item).permit(:quantity, :product_id, :cart_id)
# end
