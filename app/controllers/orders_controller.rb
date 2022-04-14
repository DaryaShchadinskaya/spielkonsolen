class OrdersController < ApplicationController
  # def create
  # 	if @current_user.orders.create(params[:order])
  #   order[product_id] = params[:order][product_id]
  # else
  # end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
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
