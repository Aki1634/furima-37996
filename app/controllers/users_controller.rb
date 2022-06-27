class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index, :create]

  def index
    if user_signed_in? && current_user.id != @product.user_id && @product.user == nil
      @product_user = ProductUser.new
    else
      redirect_to root_path
    end
  end

  def create
    @product_user = ProductUser.new.new(order_params)
    if @product_user.valid?
      pay_product
      @product_user.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  

end