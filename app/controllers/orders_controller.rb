class OrdersController < ApplicationController
  before_action :set_device, only: %i[create]
  skip_before_action :verify_authenticity_token

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(device: @device)
    if @order.save
      OrderMailer.with(order: @order).new_order_email.deliver_later
      flash[:success] = "Thank you for your booking! We'll get contact you soon!"
      redirect_to devices_path
    else
      flash[:error] = @order.errors
      render 'new'
    end
  end

  def show
    @order = Order.find(params[:id])
    @order = @order.device
  end

  private

  # def order_params
  #   params.require(:order).permit(:name, :email, :address, :phone_number)
  # end

  def set_device
    @device = Device.find(params[:device_id])
  end

  def device_params
    params.require(:device).permit(:name, :equipment, :description, :price, :image)
  end
end
