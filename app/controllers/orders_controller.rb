class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
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

  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order_shipment).permit(:postcode, :prefecture_id, :city, :block, :building, :phonenumber).merge(user_id: current_user.id, item_id: @item.id, token: params[:token], price: @item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
