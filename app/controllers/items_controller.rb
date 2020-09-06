class ItemsController < ApplicationController
  def index
  end  

  def create
    @item = Item.new(item_params)
  end 

  def item_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
