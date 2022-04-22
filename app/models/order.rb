class Order < ApplicationRecord
  belongs_to :device

  # before_save :set_subtotal
  # validates :quantity, presence: true

  # def subtotal
  #   order_items.collect { |order_item| order_item.valid? ? (order_item.unit_price * order_item.quantity) : 0 }.sum
  # end

  # private

  # def set_subtotal
  #   self[:subtotal] = subtotal
  # end
end
