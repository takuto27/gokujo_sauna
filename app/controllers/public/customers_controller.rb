class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_customer, only: [:edit, :update]
  before_action :ensure_guest_customer, only: [:edit]

  def show
    @customer = Customer.find(params[:id])
    @customers = @customer.posts
    @posts = @customer.posts.where(is_deleted: false).page(params[:page]).per(6)
  end

  def index
    @customers = Customer.all.where(is_deleted: false).page(params[:page]).per(6)
    @post = Post.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_path(@customer)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :introduction, :profile_image, :rate)
  end

  def ensure_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to customer_path(current_customer)
    end
  end

  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.name == "guestcustomer"
      redirect_to customer_path(current_customer) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end
end
