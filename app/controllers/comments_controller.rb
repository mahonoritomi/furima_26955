class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |f|
      f.html { redirect_to items_path(params[:item_id]) }
      f.json
    end
    
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
