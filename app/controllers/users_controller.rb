class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def require_login
    #false
    unless logged_in?
    flash[:info] = "Please login to gain access."
    redirect_to login_url
    end
  end

end
