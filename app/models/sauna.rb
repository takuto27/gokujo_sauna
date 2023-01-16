class Sauna < ApplicationRecord
  #has_many :tag, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_one_attached :image


  validates :sauna_name, presence: true
  validates :image, presence: true
  validates :sauna_temperature, presence: true
  validates :water_temperature, presence: true
  validates :access, presence: true
  validates :introduction, presence: true
end
