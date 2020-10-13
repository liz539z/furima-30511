class ItemsController < ApplicationController
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    redirect_to new_user_session_path unless user_signed_in?
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(current_user.id)
    else
      render action: :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :describe, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_day_id, :price, :image).merge(ç current_user.id)
  end
end
