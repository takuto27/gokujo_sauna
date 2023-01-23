class Public::BookmarksController < ApplicationController
  before_action :authenticate_customer!

  def show
    @bookmarks = Bookmark.where(customer_id: current_customer.id)
    @sauna = Sauna.find(params[:sauna_id])
  end

  def create
    @sauna = Sauna.find(params[:sauna_id])
    bookmark = @sauna.bookmarks.new(customer_id: current_customer.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @sauna = Sauna.find(params[:sauna_id])
    bookmark = @sauna.bookmarks.find_by(customer_id: current_customer.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
