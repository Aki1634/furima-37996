class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :create, :new]
  # before_action :set_item, only: []

  def index
    # @products = Product.limit(10).order('id DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :image, :explanation, :price, :category_id, :situation_id, :charge_id,:prefectures_id, :ship_day_id).merge(user_id: current_user.id)
  end
end
