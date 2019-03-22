class FollowingController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @following_users = @user.following
  end
end
