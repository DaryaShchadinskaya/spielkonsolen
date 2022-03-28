class PagesController < ApplicationController

  def home
    @device = Device.paginate(page: params[:page], per_page: 10)
    @q = Device.ransack(params[:q])
    @device = @q.result.order(id: :desc).page(params[:page])
  end  
  
  def about
  end
  
  end 
