class CarSerializer < ActiveModel::Serializer
  # include Rails.application.routes.url_helpers
  attributes :id, :manufacturer_id, :category_id, :model, :status, :price, :image_url

  belongs_to :manufacturer
  belongs_to :category
end
