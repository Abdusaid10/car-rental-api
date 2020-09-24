class CarSrializer < ActiveModel:: Serializer
  attributes :id, :model, :status, :price, :image, :description, :color

  belongs_to :category
  belongs_to :manufacturer
end