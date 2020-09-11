class OrdersController < ApplicationController

  def index
    # @order = Order.new
    @item = Item.find(params[:item_id])
    # @order = Order.new
  end

  def create   
  end


  private
  
  def order_params
    recuire.prams(:order).permitted(:price, :user_id, :item_id)
  end
end
