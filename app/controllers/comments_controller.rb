class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    article = Article.find(params[:article_id])
    comments = article.comments
    render json: comments
  end

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create
    @article = Article.find(params[:article_id])
    params[:comment][:user_id]= current_user.id
    params[:comment][:article_id] = @article.id
    @comment = Comment.new(comment_params)
    @comment.save!

    render json: @comment
  end

  def edit
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.update(comment_params)
      redirect_to article_path(@article), notice: 'Edit Comment!!'
    else
      render :edit
    end
  end

  def destroy
    article = Article.find(params[:article_id])
    comment = article.comments.find(params[:id])
    comment.destroy!
    redirect_to article_path(article), notice: 'Deleted Comment'

  end
  private
  def comment_params
    params.require(:comment).permit(
      :content,
      :article_id,
      :user_id
    )
  end


end
