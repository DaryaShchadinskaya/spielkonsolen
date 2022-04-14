class Cart < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :devices, through: :order_items
end
