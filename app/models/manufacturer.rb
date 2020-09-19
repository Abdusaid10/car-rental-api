class Manufacturer < ApplicationRecord
  has_many :cars
  has_many :categories
  has_many_attached :images
  has_one_attached :logo

  # validates :manufacturer, presence: true
end
