class Order < ApplicationRecord
  belongs_to :device

  validates :quantity, presence: true, length: { maximum: 1_000_000 }
  validates :phone_number, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 5, maximum: 100 }
  validates :delivery, presence: true
  validates :full_name, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 1, maximum: 100 }
  validates :date_of_booking, presence: true

  # def total_price
  #   order.quantity * order.device.price
  # end
end

