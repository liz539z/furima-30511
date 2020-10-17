class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :edit
  before_action :set_item, only:[:show, :edit, :update]
  def index
    @items = Item.all.order('created_at DESC')
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
  end

  def edit
    if user_signed_in? && current_user == @item.user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(:name, :describe, :category_id, :condition_id, :postage_id, :prefecture_id, :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
