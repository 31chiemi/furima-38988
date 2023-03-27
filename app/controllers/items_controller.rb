class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit, :destroy]
  # 出品時にログインしていない場合はログイン画面に推移する
  # edit show updateの実行前にset_itemを実行する
  # 出品者以外がログインしている際はmove_to_indexを実行する
  
  def index
    @items = Item.all.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id) 
    else
      render :edit
    end
  end

  def destroy
    if set_item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :condition_id, :charge_id, :prefecture_id, :term_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless current_user.id ==  set_item.user_id
      redirect_to root_path
    end
  end
end