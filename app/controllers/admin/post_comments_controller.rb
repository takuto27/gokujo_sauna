class Admin::PostCommentsController < ApplicationController



  def hide
    @comment = Comment.find(params[:comment_id])
    @comment.update(is_deleted: true)
    redirect_to request.referer
  end

  def display
    @comment = PostComment.find_by(id: params[:id])
    #post_id = comment.post_id
    PostComment.find_by(id: comment.id).update(is_deleted: false)
    redirect_to admin_post_path(post_id)
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end

