class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy

  accepts_nested_attributes_for :order_items, allow_destroy: true

  def total_price
    order_items.map { |item| item.product.price * item.quantity }.sum
  end
end
