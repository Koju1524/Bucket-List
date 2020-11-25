class FollowsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow!(params[:account_id])
    @user = User.find(params[:account_id])
    @follower_figure = @user.followers.count
  end

end
