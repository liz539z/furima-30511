class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day
  belongs_to :user
  has_one_attached :image
  with_options presence: true do
    validates :image 
    validates :name
    validates :describe
    validates :price, format: {with: /\A[0-9]+\z/, message: "Half-width number"}
    validates :category_id, numericality: { other_than: 1, message: " Select" } 
    validates :condition_id, numericality: { other_than: 1, messages: "Select"} 
    validates :postage_id, numericality: { other_than: 1, messages: "Select"} 
    validates :prefecture_id, numericality: { other_than: 1, messages: "Select"} 
    validates :delivery_day_id, numericality: { other_than: 1, messages: "Select"}
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range"}






end
