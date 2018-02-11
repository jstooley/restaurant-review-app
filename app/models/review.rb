class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5 }
  validates :content, length: { maximum: 500 }
  validates :title, length: { maximum: 50 }
end