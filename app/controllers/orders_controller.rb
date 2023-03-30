class OrdersController < ApplicationController
  def index
    @order_shipment = OrderShipment.new
  end
  
  def create
    @order_shipment = OrderShipment.new(order_params)
    @order_shipment.save
  end
  
  private

  def order_params
    params.require(:order_shipment).permit(:postcode, :prefecture, :city, :block, :building, :phonenumber).merge(user_id: current_user.id, item_id: item.id)
  end

end
