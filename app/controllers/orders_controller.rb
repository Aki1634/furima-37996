class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :set_item, only: [:index, :create]
  
    def index
      if current_user.id != @product.user_id && @product.order == nil
        @product_order = ProductOrder.new
      else
        redirect_to root_path
      end
    end
  
    def create
      @product_order = ProductOrder.new(order_params)
      if @product_order.valid?
        pay_item
        @product_order.save
        return redirect_to root_path
      else
        render :index
      end
    end
  
    private
  
    def set_item
      @product = Product.find(params[:product_id])
    end
  
    def order_params
      params.require(:product_order).permit(:postal_code, :prefectures_id, :city_name, :block_name, :building_name, :phone_number).merge(token: params[:token], product_id: params[:product_id], user_id: current_user.id )
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.price,  
        card: order_params[:token],    
        currency: 'jpy'                 
      )
    end
end


   

