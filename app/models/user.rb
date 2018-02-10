class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews
  has_many :restaurants, through: :restaurant_foods

  validates :password, presence: true
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end