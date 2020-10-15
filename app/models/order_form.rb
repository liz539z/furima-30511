class OrderForm
  include ActiveModel::Model
  attr_accessor :token,:postcode, :city, :address, :building, :prefecture_id, :phone_num, :user_id, :item_id

  with_options presence: true do
    validates :postcode, format: { with:/\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :address
    validates :phone_num, format: { with:/\A\d{10,11}\z/, message:"Input only number"}
    validates :token
  end


    def save
      
      order = Order.create(item_id: item_id, user_id: user_id)
      Destination.create(postcode: postcode, prefecture_id: prefecture_id, city: city, address:address, building: building, phone_num: phone_num, order_id: order.id)

    end
end