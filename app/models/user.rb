class User < ApplicationRecord
  has_many :order
  before_save { self.email = email.downcase }

  validates :username, presence: true, 
            uniqueness: { case_sensitive: false }, 
            length: { minimum: 1, maximum: 100 }
  validates :phone, presence: true, length: { maximum: 11 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { minimum: 5, maximum: 100 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  has_secure_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :admin]

end
