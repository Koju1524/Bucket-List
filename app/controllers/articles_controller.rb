class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to article_path(@article), notice: 'saveされました!'
    else
      flash.now[:error] = '保存に失敗しました'
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

        @achieved_article = AchievedArticle.new
        @achieved_article.title = @article.title
        @achieved_article.user_id = @article.user_id
        @achieved_article.article_id = @article.id
    
        if AchievedArticle.where(user_id: @article.user_id, article_id: @article.id).size > 0
          flash.now[:error] = '達成したBucket-Listから編集して下さい！'
          render :edit
        else
          if @achieved_article.save
            redirect_to edit_article_achieved_article_path(@article, @achieved_article)
          else
            flash.now[:error] = '保存に失敗しました'
            render :edit
          end
        end
      else
        redirect_to article_path(@article), notice: '編集に成功!'
      end

    else
      flash.now[:error] = '保存に失敗しました'
      render :edit
    end
  end

  def destroy
    article = current_user.articles.find(params[:id])
    article.destroy!
    redirect_to root_path, notice: 'Bucketn Listを削除しました'
  end

  private
    def article_params
        params.require(:article).permit(
          :title,
          :reason,
          :necessary_stuff,
          :expiration,
          :achievement_flag
        )
    end

  def set_article
    @article = Article.find(params[:id])
  end

end
