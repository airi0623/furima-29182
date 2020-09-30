class UsersController < ApplicationController
  before_action :category_set, only: [:category_search, :index, :edit, :show, :update, :destroy, :search]
  
  def new
  end

  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: params[:id]).order("created_at DESC")
  end


  private

  def category_set
    @categorys = Category.where(id: 2..10)
  end
end


