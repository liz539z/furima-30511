class ItemsController < ApplicationController
  def index
  end

  def new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
    @item = Item.new
  end


  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path (current_user.id)
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :describe, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
