class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :sauna

  validates :title, presence: true
  validates :body, presence: true

end
