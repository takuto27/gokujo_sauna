class Admin::PostCommentsController < ApplicationController



  def hide
    @comment = PostComment.find(params[:comment_id])
    @comment.update(is_deleted: true)
    redirect_to request.referer
  end

  def display
    #@comment = PostComment.find_by(id: params[:id])
   # byebug
    PostComment.find_by(id: params[:comment_id]).update(is_deleted: false)
    redirect_to admin_post_path(params[:post_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment, :is_deleted)
  end
end

