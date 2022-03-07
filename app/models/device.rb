class Device < ApplicationRecord
  attr_accessor :upload

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :complectation, presence: true, length: { minimum: 2, maximum: 500 }
  validates :price, presence: true, length: { minimum: 1, maximum: 7 }
  validates :description, presence: true, length: { minimum: 1, maximum: 5000 }
  
  MAX_FILESIZE = 10.megabytes
  validate :uploaded_file_size

  private 

  def uploaded_file_size
    if upload 
      errors.add(:upload, "File size must be less than #{self.class::MAX_FILESIZE}") unless upload.size <= self.class::MAX_FILESIZE
    end    
  end
end 
  