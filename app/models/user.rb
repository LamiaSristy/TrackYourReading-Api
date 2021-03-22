class User < ApplicationRecord
  has_secure_password
  has_many :books, dependent: :destroy
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 4 }
  validates :password, length: { minimum: 6 }
end
