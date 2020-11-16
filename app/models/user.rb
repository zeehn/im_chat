class User < ApplicationRecord 
  validates :username, presence: true, length: { minimum: 3, maximum: 30 }
  has_secure_password
  has_many :messages
end