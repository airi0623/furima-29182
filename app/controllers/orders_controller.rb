class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    # @order = @item.orders.new(price: order_params[:price])
    # binding.pry
    if @order.valid?
       pay_item
       @order.save
       return redirect_to root_path
    else
       render 'index'
    end
  end


  private
  
  def order_params
    #@item = Item.find(params[:item_id])
    params.permit(:token, :item_id).merge(user_id: current_user.id) #, price: @item.price
    #params.require(:order).permitted(:token, :price, :user_id, :item_id)
  end

  # def price_params
  #   @item = Item.find(params[:item_id])
  #   params.require(:item).permit(:price)
  # end

  def pay_item
    # binding.pry
    Payjp.api_key = "sk_test_df4f93df9a8971acd7c22421" 
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
