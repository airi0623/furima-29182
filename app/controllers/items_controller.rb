class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC")
    # or @items = Item.all.order("created_at DESC")
    # itemsテーブルを参照する際に見るテーブルのこと。
  end  

  def new
    authenticate_user!
    @item = Item.new
  end 


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end 

  private
  
  def item_params
    params.require(:item).permit(:item_name, :detail,:category_id,:status_id,:shipping_charge_id,:shipping_region_id,:date_shipment_id,:price, :image).merge(user_id: current_user.id)
  end
end
