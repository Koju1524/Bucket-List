class FollowingAchievedArticlesController < ApplicationController
  before_action :authenticate_user!

  def show
    user_ids = current_user.followings.pluck(:id)
    @achieved_articles = AchievedArticle.where(user_id: user_ids)
  end

end