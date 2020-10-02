class UsersController < ApplicationController
  before_action :category_set, only: [:category_search, :index, :edit, :show, :update, :destroy, :search]
  
  def new
  end

  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: params[:id]).order("created_at DESC")
    
    like = Like.where(user_id: current_user.id)

    
    # @like_items = Item.where(params:[item_id]) 
    #@like_items = Item.find(params[:id][]) wrong number of arguments (given 0, expected 1..2)
    #@like_items = Item.find(id: :item_id) Couldn't find Item with 'id'={:id=>:item_id}
    #@like_items = Item.find(item_id) undefined local variable or method `item_id' for #<UsersController:0x00007fa108b60890> Did you mean? item_url
    #@like_items = Item.where(params:[item_id]) undefined local variable or method `item_id' for #<UsersController:0x00007fa108f28f68> Did you mean? item_url
    #@like_items = Item.find(like.item_id)
  end


  private

  def category_set
    @categorys = Category.where(id: 2..10)
  end
end


