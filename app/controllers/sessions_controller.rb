class SessionsController < ApplicationController 
  before_action :login_redirect, only: [:new, :create]
  def new 
    @user = User.new
  end
  
  def create 
    user = User.find_by(username: params[:session][:username])
    if user and user.authenticate(params[:session][:password])
      flash[:success] = "Logged in successfully"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = "Invalid credentials. Try again!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:error] = "Logged out successfully"
    redirect_to login_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

  def login_redirect
    if logged_in?
      flash[:error] = "You are already logged in."
      redirect_to root_path
    end
  end
end