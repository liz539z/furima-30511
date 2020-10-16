class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
    @orders = Order.includes(:item)
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(current_user.id)
    else
      render action: :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @orders = Order.includes(:item)
  end

  private

  def item_params
    params.require(:item).permit(:name, :describe, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
