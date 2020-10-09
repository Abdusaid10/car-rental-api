class ManufacturerDetailsSerializer < ActiveModel::Serializer
  attributes :id, :manufacturer, :about, :image_url, :logo_url
end