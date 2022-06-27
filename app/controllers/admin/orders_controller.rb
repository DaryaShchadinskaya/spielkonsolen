class Admin::OrdersController < Admin::BaseController
  before_action :set_order, only: %i[show]

  def show; end

  def index
    @order = Order.paginate(page: params[:page], per_page: 10)
  end

  def new
    @order = Order.new
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :phone_number)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
