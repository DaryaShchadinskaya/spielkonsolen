class Order < ApplicationRecord
  # belongs_to :cart
  belongs_to :device

  before_save :set_subtotal
  # validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  # validates :equipment, presence: true, length: { minimum: 2, maximum: 500 }
  # validates :price, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**7) }
  # validates :image, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..10.megabytes }

  # def subtotal
  #   order_items.collect { |order_item| order_item.valid? ? (order_item.unit_price * order_item.quantity) : 0 }.sum
  # end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
