class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :title, presence: true
  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5 }
end