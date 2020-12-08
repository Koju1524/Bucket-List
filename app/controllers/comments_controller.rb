class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.find(params[:article_id])
    @achieved_article = AchievedArticle.find(params[:achieved_article_id])
    @comment = Comment.new
  end

  def create
    @article = Article.find(params[:article_id])
    @achieved_article = AchievedArticle.find(params[:achieved_article_id])
    params[:comment][:user_id]= current_user.id
    params[:comment][:article_id] = @article.id
    params[:comment][:achieved_article_id] = @achieved_article.id
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to article_achieved_article_path(@article, @achieved_article),  notice: 'Successful Comment!!'
    else
      flash.now[:error] = 'Failed Comment'
      render :new
    end
  end

  def edit
    @article = Article.find(params[:article_id])
    @achieved_article = AchievedArticle.find(params[:achieved_article_id])
    @comment = @achieved_article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @achieved_article = AchievedArticle.find(params[:achieved_article_id])
    @comment = @achieved_article.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to article_achieved_article_path(@article, @achieved_article), notice: 'Edit Comment!!'
    else
      flash.now[:error] = 'Failed Edit'
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:article_id])
    achieved_article = AchievedArticle.find(params[:achieved_article_id])
    comment = achieved_article.comments.find(params[:id])
    comment.destroy!
    redirect_to article_achieved_article_path(article, achieved_article), notice: 'Deleted Comment'
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

end
