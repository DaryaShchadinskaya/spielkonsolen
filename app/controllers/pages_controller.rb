class PagesController < ApplicationController

  def show
    @device = Device.find(params[:id])
  end

  def index    
    if current_user.admin?
      render 'index'
    else 
      render ''
    @device = Device.all
  end    
  
end

end
