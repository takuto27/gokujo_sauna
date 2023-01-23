class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :sauna

  validates :customer_id, uniqueness: { scope: :sauna_id }
end
