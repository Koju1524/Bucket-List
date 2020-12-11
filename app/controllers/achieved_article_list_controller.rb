class AchievedArticleListController < ApplicationController

  def index
    @user = User.find(params[:account_id])
    @achieved_articles = AchievedArticle.where(user_id: @user.id)
  end
end