class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    end
    @order = OrderAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
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
    params.permit(:token, :item_id,:postal_code, :prefecture_id, :city, :number, :building,:phone).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_df4f93df9a8971acd7c22421" 
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
end

  # -------------------------------------
  # def create
  #   @item = Item.find(params[:item_id])
  #   @address= Address.new(address_params)
  #   @order = Order.new(order_params)
  #   if @address.valid? && @order.valid?
  #      pay_item
  #      @adrress.save
  #      @order.save
  #      return redirect_to root_path
  #   else
  #      render 'index'
  #   end
  # end

  # def address_params
  #   params.permit(:token, :item_id,:postal_code, :prefecture_id, :city, :number, :building,:phone).merge(user_id: current_user.id)
  # end

  # def order_params
  #   params.permit(:item_id).merge(user_id: current_user.id)
  # end
  # -------------------------------------
  # def sold_out
  #   orders = Order.all
  #   orders = [order{:user_id, :item_id},   ,     ,    ]
  #   orders.each do ||
  #   if orders.exist?(params[:item_id])
  #     redirect_to root
  #   end
  # end
  # -------------------------------------