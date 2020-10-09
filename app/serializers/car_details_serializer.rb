class CarDetailsSerializer < ActiveModel::Serializer
  # include Rails.application.routes.url_helpers
  attributes :id, :manufacturer_id, :category_id, :model, :status, :price, :color, :year, :description, :image_url
 
  has_many :bookings
  belongs_to :manufacturer
  belongs_to :category
end