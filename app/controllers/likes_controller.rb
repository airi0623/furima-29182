class LikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @items = Item.all.sort {|a,b| b.likes.count <=> a.likes.count}
    @categorys = Category.where(id: 2..10)
  end

  def create
    user = current_user.id
    @item = Item.find(params[:item_id])
    Like.create!(user_id: user, item_id: @item.id)
    #render 'create.js.erb'
  end

  def destroy
    @item = Item.find(params[:item_id])  
    like = Like.find_by(user_id: current_user.id, item_id: @item.id )
    like.delete
    #render 'destroy.js.erb'
  end
end