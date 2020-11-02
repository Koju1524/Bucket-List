class ArticlesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: 'Successful Submit!!'
    else 
      flash.now[:error] = 'failed Submit'
      render :new
    end
  end

  private
    def article_params
        params.require(:article).permit(
          :title, 
          :reason,
          :necessary_stuff,
          :expiration,
          :picture,
          :achievement_flag
        )
    end

end
