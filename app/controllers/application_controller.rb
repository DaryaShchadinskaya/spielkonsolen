class ApplicationController < ActionController::Base
  include ApplicationHelper
  
  protect_from_forgery with: :exception
  # before_action :current_cart
  helper_method :logged_in?

  def set_search
    @q = Device.search(params[:q])
  end

  def logged_in?
    !!current_user
  end

  private

  # def current_cart
  #   binding.pry
  #   if session[:cart_id]
  #     cart = Cart.find_by(id: session[:cart_id])
  #     if cart.present?
  #       return cart
  #     else
  #       session[:cart_id] = nil
  #     end
  #   end

  #   if session[:cart_id].nil?
  #     @current_cart = Cart.create
  #     session[:cart_id] = @current_cart.id
  #   end
  # end
end
