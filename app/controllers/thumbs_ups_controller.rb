class ThumbsUpsController < ApplicationController
  before_action :set_article, only: [:create, :destroy]
  before_action :set_achieved_article, only: [:create, :destroy]
  before_action :authenticate_user!

  def create
    @achieved_article.thumbs_ups.create!(user_id: current_user.id)
  end

  def destroy
    thumbs_up = @achieved_article.thumbs_ups.find_by!(user_id: current_user.id)
    thumbs_up.destroy!
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_achieved_article
    @achieved_article = AchievedArticle.find(params[:achieved_article_id]) 
  end

end
