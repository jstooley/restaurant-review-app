class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews
  has_many :restaurants, through: :restaurant_foods
  validates :password, presence: true
end