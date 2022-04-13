class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  helper_method :logged_in?
  # before_action :authenticate_user!


  def set_search
    @q = Device.search(params[:q])
  end

  def logged_in?
    !!current_user
  end

end
