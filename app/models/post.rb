class Post < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  has_many :areas, dependent: :destroy
  belongs_to :customer
  belongs_to :sauna


  validates :title, presence: true
  validates :body, presence: true

  scope :rate_count, -> {order(rate: :desc)}
end
