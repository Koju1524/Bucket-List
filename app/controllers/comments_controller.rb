class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @article = Article.find(params[:article_id])
    @comment = Comment.new
  end

  def create
    binding.pry
    @article = Article.find(params[:article_id])
    params[:comment][:user_id] = current_user.id
    @comment = Comments.new(comment_params)
    if @comment.save
      redirect_to article_path(@article), notice: 'Add Comment!!'
    else 
      flash.now[:error] = 'Failed comment'
      render :new
    end
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
