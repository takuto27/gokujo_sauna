class Tag < ApplicationRecord
  #belongs_to :sauna
  validates :tag_name, presence: true
end
