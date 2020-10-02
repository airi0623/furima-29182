class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show,:update,:destroy]
  before_action :category_set, only: [:category_search, :index, :edit, :show, :update, :destroy, :search]
  before_action :search_items, only: [:category_search, :search]

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
    @like = Like.new
    #@count = Like.where(item_id: @item.id).length
  end

  def edit
  end

  def update
    if @item.update(item_params)
      binding.pry
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

  def search
    @results = @p.result.all
    @items = Item.where(params[:q][:category_id]).order("created_at DESC")
    @category = Category.find(params[:q][:category_id])
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

  def search_items
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
    # 慣習的に@p or @q
  end
end
