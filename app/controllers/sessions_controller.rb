class SessionsController < ApplicationController
  def new

  end

  def create 
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:info] = "Succesfully logged in."
      redirect_to root_path
    else
      flash[:danger] = "Invaild Credentials."
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_url
  end


end
