class Admin::SaunasController < ApplicationController


  def index
    @saunas = Sauna.all.page(params[:page]).per(8) #8項目毎にページネート
    @sauna = Sauna.new
  end

  def new
    @sauna = Sauna.new
  end

  def create
    @sauna = Sauna.new(sauna_params)
    @sauna.save!
    redirect_to admin_sauna_path(@sauna.id)
  end

  def show
    @sauna = Sauna.find(params[:id])
    @sauna_new = Sauna.new
  end

  def edit
    @sauna = Sauna.find(params[:id])
  end

  def update
    @sauna = Sauna.find(params[:id])
    @sauna.update(sauna_params)
    redirect_to admin_sauna_path(@sauna)
  end

  private

  def sauna_params
    params.require(:sauna).permit(:tag_id, :sauna_name, :image, :sauna_temperature, :water_temperature, :access, :phone_number, :introduction, :is_active, :prefecture).merge(prefecture: params[:sauna][:prefecture].to_i)
  end

end
