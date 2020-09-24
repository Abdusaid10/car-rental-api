class ManufacturerSerializer < ActiveModel:: Serializer
  attributes :id, :manufacturer, :about, :image, :logo

  # has_many :cars
  # has_many :categories
end