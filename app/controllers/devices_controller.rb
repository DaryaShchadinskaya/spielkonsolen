class DevicesController < ApplicationController
  def show
    @device = Device.find(params[:id])
  end

  def index
    @device = Device.paginate(page: params[:page], per_page: 10)
    @devices = if params[:search]
                 Device.search(params[:search]).order('created_at DESC')
               else
                 Device.all.order('created_at DESC')
               end
    @order_items = current_order.order_items.new
  end
end
