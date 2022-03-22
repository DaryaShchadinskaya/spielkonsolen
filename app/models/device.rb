class Device < ApplicationRecord
  has_one_attached :image 

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :complectation, presence: true, length: { minimum: 2, maximum: 500 }
  validates :price, presence: true, length: { minimum: 1, maximum: 7 }
  validates :image, blob: { content_type: ['image/jpg', 'image/jpeg', 'image/png'], size_range: 1..10.megabytes }
  
end 
  