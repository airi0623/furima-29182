class OrdersController < ApplicationController
  before_action :set_item, only:[:index, :create]

  def index
    authenticate_user!
    if @item.order.present? || current_user.id == @item.user_id
      redirect_to root_path
    end
    @order = OrderAddress.new
  end
  
  def create
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

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
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