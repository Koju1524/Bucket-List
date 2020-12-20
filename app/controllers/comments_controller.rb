class CommentsController < ApplicationController
  before_action :set_article, only: [:new, :create, :edit, :update]
  before_action :set_achieved_article, only: [:new, :create, :edit, :update]
  before_action :set_comment, only: [:edit, :update]
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    params[:comment][:user_id]= current_user.id
    params[:comment][:article_id] = @article.id
    params[:comment][:achieved_article_id] = @achieved_article.id
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to article_achieved_article_path(@article, @achieved_article),  notice: 'コメントできました!'
    else
      flash.now[:error] = 'コメントに失敗しました'
      render :new
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to article_achieved_article_path(@article, @achieved_article), notice: 'コメントを編集しました!'
    else
      flash.now[:error] = '編集に失敗しました'
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:article_id])
    achieved_article = AchievedArticle.find(params[:achieved_article_id])
    comment = achieved_article.comments.find(params[:id])
    comment.destroy!
    redirect_to article_achieved_article_path(article, achieved_article), notice: 'コメントを削除しました'
  end

  private
  def comment_params
    params.require(:comment).permit(
      :content,
      :article_id,
      :user_id,
      :achieved_article_id,
    )
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_achieved_article
    @achieved_article = AchievedArticle.find(params[:achieved_article_id])
  end

  def set_comment
    @comment = @achieved_article.comments.find(params[:id])
  end

end
