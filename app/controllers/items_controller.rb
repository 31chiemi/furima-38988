class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :condition_id, :charge_id, :prefecture_id, :term_id, :image).merge(user_id: current_user.id)
  end
end