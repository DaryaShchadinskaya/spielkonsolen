class DevicesController < ApplicationController
  def show
    @device = Device.find(params[:id])
  end

  def index
    if Device.where(status: [:active])
      @device = Device.paginate(page: params[:page], per_page: 10)
      @devices = if params[:search]
                   Device.search(params[:search]).order('created_at DESC')
                 else
                   Device.all.order('created_at DESC')
                 end
    end
  end
end
