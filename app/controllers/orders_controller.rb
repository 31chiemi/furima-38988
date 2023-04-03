class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item
  before_action :move_to_item_index, only: [:index]

  def index
    @order_shipment  = OrderShipment.new
  end
  
  def create
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      pay_item
      @order_shipment.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_shipment).permit(:postcode, :prefecture_id, :city, :block, :building, :phonenumber).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                # 通貨の種類（日本円）
    )
  end
  
  def move_to_item_index
      if current_user.id == @item.user_id
        redirect_to root_path
      elsif @item.order != nil && current_user.id != @item.user_id
        redirect_to root_path
      end
    end
end
