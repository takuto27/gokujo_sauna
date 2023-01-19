class Public::SaunasController < ApplicationController

  def index
    #@tags = Tag.all
    @saunas = Sauna.all.where(is_active: true).page(params[:page]).per(8) #8項目毎にページネート
    #@all_saunas = Sauna.all..where(is_active: true)
  end

  def show
    #@tags = Tag.all
    @sauna = Sauna.find(params[:id])
    @post_comment = PostComment.new
  end
end

