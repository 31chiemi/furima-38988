class OrderShipment
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phonenumber, :item_id
  with_options presence: true do
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end
  validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}

  def save
    # 購入情報を保存し、変数orderに代入する
    order = Order.create(item_id: item_id, user_id: user_id)
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Address.create(postcode: postcode, prefecture: prefecture_id, city: city, block: block, building: building, phonenumber: phonenumber, order_id: order.id)
  end
end