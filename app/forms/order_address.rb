class OrderAddress
  include ActiveModel::Model
  attr_accessor :token,:postal_code, :prefecture_id, :city, :number, :building, :phone, :price, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "input correctly" }
    validates :prefecture_id, numericality: {other_than: 0, message: "Select" }
    validates :city, format: { with: /\A(.*?市)?(.*?区)?(.*?郡)?[ぁ-んァ-ン一-龥].*?/, message: "input correctly" }
    validates :number
    validates :phone, format: { with: /\A[0]\d{9,10}/, message: "number input correctly", }
    validates :phone, length: { maximum: 11, message: "number too longth"}
  end
  validates :token,presence: true
    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, number: number, phone: phone)
    end
end