class Public::PostsController < ApplicationController

  def index
    @posts = Post.all
    @saunas = Sauna.all
  end

  def new
    @post = Post.new
    @sauna = Sauna.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @sauna = Sauna.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.is_deleted = false
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
    params.require(:post).permit(:title, :body, :sauna_id)
  end

end

