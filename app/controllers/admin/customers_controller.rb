class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @all_customers = Customer.all.page(params[:page]).per(8) #8項目毎にページネート
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.all.page(params[:page]).per(6)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer.id), notice: "You have updated user successfully."
    else
      redirect_to request.referer
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email, :is_deleted)
  end
end
