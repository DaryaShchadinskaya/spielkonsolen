class DevicesController < ApplicationController
  skip_before_action :authenticate_user!, only: 'reply', raise: false

  def show
    @device = Device.find(params[:id])
  end

  def index
    redirect_to admin_devices_path if current_user
    @device = Device.actual.paginate(page: params[:page], per_page: 10)
    @devices = if params[:search]
                 Device.actual.search(params[:search]).order('created_at DESC')
               else
                 Device.actual.order('created_at DESC')
               end
  end
end
