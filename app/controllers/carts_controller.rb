class CartsController < ApplicationController
  # def show
  #   @order_items = current_order.order_items
  # end

  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end
  
end
