class Manufacturer < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_many :cars, dependent: :destroy
  has_many :categories
  has_one_attached :image
  has_one_attached :logo

  validates :manufacturer, presence: true

  def image_url
    url_for(image)
  end

  def logo_url
    url_for(logo)
  end
end
