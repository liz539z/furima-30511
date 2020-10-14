class Destination < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :order

  with_options presence: true do
  validates :postcode, format: { with:/\A\d{3}[-]\d{4}\z/, message: "Input correctly"}
  validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
  validates :city
  validates :address
  validates :phone_num, format: { with:/\A\d{10,11}\z/, message: " Input only number"}
  end

end
