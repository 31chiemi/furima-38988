class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_shipment  = OrderShipment.new
  end
  
  def create
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      @order_shipment.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def order_params
    @item = Item.find(params[:item_id])
    params.require(:order_shipment).permit(:postcode, :prefecture_id, :city, :block, :building, :phonenumber).merge(user_id: current_user.id, item_id: @item.id)
  end
end
