class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews

  validates :password, presence: true
end