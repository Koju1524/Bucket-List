class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    article = Article.find(params[:article_id])
    @comment = article.comments.build
  end

  def create
    article = Article.find(params[:article_id])
    @comment = article.comments.build(comment_params)
    if @comment.save
      redirect_to article_path(article), notice: 'Add Comment!!'
    else 
      flash.now[:error] = 'Failed comment'
      render :new
    end
  end

  def edit
    article = Article.find(params[:article_id])
    @comment = article.comments.find_by(id: params[:id])
  end

  def update
    article = Article.find(params[:article_id])
    @comment = article.comments.find_by(id: params[:id])
    if @comment.update(comment_params)
      redirect_to article_path(article), notice: 'Successful Edit !!'
    else
      flash.now[:error] = 'Failed Edit'
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:article_id])
    comment = article.comments.find_by(id: params[:id])
    comment.destroy!
    redirect_to article_path(article), notice: 'Deleted Comment'
  end

  private
  def comment_params
    params.require(:comment).permit(
      :content
    )
  end


end
