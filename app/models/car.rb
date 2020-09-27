class Car < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :category
  belongs_to :manufacturer, dependent: :destroy
  has_one_attached :image
  has_many :bookings
  has_many :users, through: :booking

  def get_image_url
    url_for(self.image)
  end
  
end
