class CommentsController < ApplicationController

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

  

  def destroy
    article = Article.find(params[:article_id])
    comment = article.comments(id: comment.id)
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
