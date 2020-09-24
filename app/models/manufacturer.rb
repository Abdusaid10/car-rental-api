class Manufacturer < ApplicationRecord
  include Rails.application.routes.url_helpers
  
  has_many :cars
  has_many :categories
  has_one_attached :image
  has_one_attached :logo

  validates :manufacturer, presence: true

  def get_image_url
    url_for(self.image)
  end

  def get_logo_url
    url_for(self.logo)
  end

end
