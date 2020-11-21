class Archive_articlesController < ApplicationController

  def edit
    @archive_article = current_user.archive_article.new
  end


  private
  def archive_article_params
      params.require(:article).permit(
        :title, 
        :feeling,
        :advice,
        :achieved_day,
        :video,
        :picture,
      )
  end
end
