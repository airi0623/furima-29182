class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    user = current_user
    @item = Item.find(params[:item_id])
    Like.create!(user_id: @item.user_id, item_id: @item.id)
    #render 'create.js.erb'
  end

  def destroy
    @item = Item.find(params[:item_id])  
    like = Like.find_by(user_id: @item.user_id, item_id: @item.id )
    like.delete
    #render 'destroy.js.erb'
  end
end