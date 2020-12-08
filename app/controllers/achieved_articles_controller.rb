class AchievedArticlesController < ApplicationController
  before_action :set_article, only: [:index, :edit, :update]
  before_action :set_achieved_article, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  
  def index
    @achieved_article = AchievedArticle.where(article_id: @article.id)
    @achieved_articles = AchievedArticle.all
  end

  def show
    @comments = @achieved_article.comments
  end
  
  def update
    @achieved_article = AchievedArticle.find_by(article_id: @article.id, user_id: @article.user_id)
    if params[:achieved_article][:title].present? && params[:achieved_article][:impression].present? && params[:achieved_article][:advice].present? && params[:achieved_article][:achieved_day].present? && params[:achieved_article][:pictures].present?
      if @achieved_article.update(achieved_article_params)
        redirect_to article_achieved_article_path(@article, @achieved_article), notice: 'Congratulation!!'
      end
    else
      flash.now[:error] = 'Fill in the blank'
      render :edit
    end
  end

  private
    def achieved_article_params
        params.require(:achieved_article).permit(
          :title, 
          :impression,
          :advice,
          :achieved_day,
          :pictures
        )
    end

    def set_achieved_article
      @achieved_article = AchievedArticle.find(params[:id])
    end

    def set_article
      @article = Article.find(params[:article_id])
    end

end