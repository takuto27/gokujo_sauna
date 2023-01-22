class Public::PostsController < ApplicationController

  def index
    #@posts = Post.where(customer_id: current_customer.id)
    #@posts = Post.all
    @posts = Post.all.where(is_deleted: false)
  end

  def new
    @post = Post.new
    @sauna = Sauna.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
    @post_comments = PostComment.where(post_id: params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    #@post.is_deleted = false
    @post.favorite = 3
    if @post.save
      redirect_to post_path(@post)
    else
      @posts = Post.all
      render "index"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :sauna_id,)
  end

end

