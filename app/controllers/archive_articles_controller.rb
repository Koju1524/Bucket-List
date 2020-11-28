class ArchiveArticlesController < ApplicationController

  def edit
    articles = current_user.articles.where(achievement_flag: 1)
    @archive_article = current_user.articles
  end


  private
  def archive_article_params
      params.require(:article).permit(
        :title, 
        :feeling,
        :advice,
        :achieved_day,
        :video,
        :pictures,
      )
  end
end
