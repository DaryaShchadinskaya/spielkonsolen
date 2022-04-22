class Admin::OrdersController < Admin::BaseController
  def show
    @order = Order.find(params[:id])
  end

  def index
    @order = Order.paginate(page: params[:page], per_page: 10)
  end

  def new
    @order = Order.new
  end

  # def create
  #   @order = Order.new(order_params)
  #   @current_cart.orders.each do |item|
  #     @order.orders << item
  #     item.cart_id = nil
  #   end
  #   @order.save
  #   Cart.destroy(session[:cart_id])
  #   session[:cart_id] = nil
  #   redirect_to root_path
  # end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address)
  end
end
