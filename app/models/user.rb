class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews
  has_many :restaurants, through: :reviews

  validates :password, :username, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, :username, uniqueness: true


end