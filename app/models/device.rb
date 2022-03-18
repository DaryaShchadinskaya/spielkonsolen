class Device < ApplicationRecord
  has_one_attached :image
  #validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :complectation, presence: true, length: { minimum: 2, maximum: 500 }
  validates :price, presence: true, length: { minimum: 1, maximum: 7 }
  validates :description, presence: true, length: { minimum: 1, maximum: 5000 }
  

end 
  