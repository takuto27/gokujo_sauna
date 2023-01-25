class Admin::SearchesController < ApplicationController
  def search
    @saunas = Sauna.where(is_active: true).looks(params[:word], params[:prefecture], params[:search]).page(params[:page]).per(6) #6項目毎にページネート
  end
end
