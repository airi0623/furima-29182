class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
    @item = Item.find(params[:id])
    
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:item_name, :detail,:category_id,:status_id,:shipping_charge_id,:shipping_region_id,:date_shipment_id,:price, :image).merge(user_id: current_user.id)
  end
end
