class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      
      redirect_to comment.article
    else
      redirect_back fallback_location: comment.article
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.article
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:article_id, :name, :comment, :user_id)
  end
end
