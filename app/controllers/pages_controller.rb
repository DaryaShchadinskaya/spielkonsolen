class PagesController < ApplicationController
  before_action :set_device, only: [:show]
  skip_before_action :authenticate_user!, :only => "reply", :raise => false

  def show; end

  def index
    redirect_to admin_devices_path if current_user
    @device = Device.paginate(page: params[:page], per_page: 10)
    @devices = if params[:search]
                 Device.search(params[:search]).order('created_at DESC')
               else
                 Device.all.order('created_at DESC')
               end
  end
end
