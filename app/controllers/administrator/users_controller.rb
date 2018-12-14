class Administrator::UsersController < ApplicationController
  before_action :admin_user
 
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end


  def update
    @user = User.find(params[:id])
    @user.update(admin: true)
    redirect_to administrator_users_path
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.toggle!(:admin)
    redirect_to administrator_users_path
  end

  private
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
