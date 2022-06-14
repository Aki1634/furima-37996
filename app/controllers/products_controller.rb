class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [ :show, :edit, :update, :destroy]


  def index
    @products = Product.limit(10).order('id DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)


  end

  private

  def message_params
    params.require(:product).permit(:title, :image, :explanation, :price, :category_id, :situation_id, :charge_id, :prefectures_id, :ship_day_id).merge(user_id: current_user.id)
  end
end
