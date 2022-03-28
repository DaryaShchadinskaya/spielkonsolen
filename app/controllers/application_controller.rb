class ApplicationController < ActionController::Base

  def set_search
    @q = Device.search(params[:q])
  end

end
