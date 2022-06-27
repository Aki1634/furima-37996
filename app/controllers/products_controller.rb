class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
   before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order(created_at: "DESC")
    
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if  @product.valid?
      @product.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def set_item
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :image, :explanation, :price, :category_id, :situation_id, :charge_id,:prefectures_id, :ship_day_id).merge(user_id: current_user.id)
  end
end
