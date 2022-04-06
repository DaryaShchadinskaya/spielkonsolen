class Device < ApplicationRecord
  has_one_attached :image
  has_many :order_items

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :equipment, presence: true, length: { minimum: 2, maximum: 500 }
  validates :price, numericality: { greater_than_or_equal_to: 0, less_than: BigDecimal(10**7) }
  validates :image, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..10.megabytes }
  validates :status, presence: true

  STATUSES = [:actual, :deleted]

  def self.search(search)
    where("name LIKE ?", "%#{search}%")     
  end

end 
  