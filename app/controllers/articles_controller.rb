class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
  end

  def show
    @comments = @article.comments
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: 'Successful Submit !!'
    else 
      flash.now[:error] = 'Failed Submit'
      render :new
    end
  end

  def edit
    @article = current_user.articles.find(params[:id])
  end

  def update
    @article = current_user.articles.find(params[:id])
    if @article.update(article_params)
      if @article.achievement_flag == "Achievement"
        
        redirect_to "/archive_article/#{@article.id}/edit"
      else
        redirect_to article_path(@article), notice: 'Successful Edit !!'
      end
    else 
      flash.now[:error] = 'Failed Edit'
      render :edit
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy!
    redirect_to root_path, notice: 'Deleted Bucketn List'
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

  def set_article
    @article = Article.find(params[:id])
  end

end
