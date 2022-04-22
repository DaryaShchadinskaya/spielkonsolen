class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception
  helper_method :logged_in?

  def set_search
    @q = Device.search(params[:q])
  end

  def logged_in?
    !!current_user
  end
end
