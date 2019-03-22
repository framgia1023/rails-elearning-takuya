class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    @follow_action = Relationship.where(follower_id: current_user.id).last
    @follow_action.create_activity(user_id: current_user.id)
    redirect_to request.referrer
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    @unfollow_action = Relationship.find(params[:id])
    action = Activity.where(id: @unfollow_action.id).destroy_all
    current_user.unfollow(user)
    redirect_to request.referrer
  end

end
