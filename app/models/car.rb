class Car < ApplicationRecord
  belongs_to :category
  belongs_to :manufacturer, dependent: :destroy
  has_one_attached :images
  has_many :bookings
  has_many :users, through: :booking
end
