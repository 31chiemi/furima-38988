FactoryBot.define do
  factory :order_shipment do
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '中央区' }
    block { '銀座' }
    building { '銀座ハイツ' }
    phonenumber { 1111111111 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
