class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def edit
    @user = User.find_by_id(params[:id]) 
  end 

   def create
    @user = User.new(user_params)
    if @user.save
      create_user_profile
      flash[:notice] = "Welcome to the Spielkonsolen, you have successfully signed up"
      redirect_to devices_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :phone)
  end

  def create_user_profile
    @user = User.new(user_params)
    @user.username = params[:user][:username]   
    @user.phone = params[:user][:phone]
    @user.user_id = @user.id    
    @user.save
  end  

end

