class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show,:update,:destroy]
  before_action :category_set, only: [:category_search, :index, :edit, :show,:update,:destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end  

  def new
    authenticate_user!
    @item = Item.new
    @order = Order.new
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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  def category_search
    @items = Item.where(category_id: params[:format]).order("created_at DESC")
    @category = Category.find(params[:format])
  end


  private
  
  def item_params
    params.require(:item).permit(:item_name, :detail,:category_id,:status_id,:shipping_charge_id,:shipping_region_id,:date_shipment_id, :price,images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def category_set
    @categorys = Category.where(id: 2..10)
  end
end
