class Public::PostCommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.post_id = @post.id
    comment.is_deleted = false
    comment.save
    redirect_to post_path(@post.id)
  end

  def destroy
    comment = PostComment.find_by(id: params[:id])
    post_id = comment.post_id
    PostComment.find_by(id: params[:id]).destroy
    redirect_to post_path(post_id)
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
