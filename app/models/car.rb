class Car < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :category, dependent: :destroy
  belongs_to :manufacturer, dependent: :destroy

  has_many :bookings, dependent: :destroy
  has_many :users, through: :booking

  has_one_attached :image

  def image_url
    url_for(image)
  end
end
