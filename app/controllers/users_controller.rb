class UsersController < ApplicationController
  before_action :category_set, only: [:category_search, :index, :edit, :show, :update, :destroy, :search]
  
  def new
  end

  def show
    @user = User.find(params[:id])
    @items = Item.where(user_id: params[:id]).order("created_at DESC")
  end

  def update
    if current_user.update(user_params)
      @user = User.find(params[:id])
      redirect_to user_path
    else
      render :show # 表示させたいビューのアクション
    end
  
    #@count = Like.where(item_id: @item.id).length
  end


  private

  def category_set
    @categorys = Category.where(id: 2..10)
  end

  def user_params
    params.require(:user).permit(:nickname, :family_name, :first_name, :family_name_kana, :first_name_kana,:birth_date, :email ,:password)
  end
end
