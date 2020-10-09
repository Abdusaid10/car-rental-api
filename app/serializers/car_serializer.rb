class CarSerializer < ActiveModel::Serializer
  # include Rails.application.routes.url_helpers
  attributes :id, :manufacturer_id, :category_id, :model, :status, :price, :image_url

  belongs_to :manufacturer
  belongs_to :category
  has_many :bookings
  # def image_url
  #   url_for(image)
  # end

  def manufacturer 
    object.manufacturer
  end

  # def initialize(cars, manufacturer, category)
  #   @cars = cars
  #   @serialize_manufacturers = ManufacturerSerializer.new(manufacturer)
  #   @serialized_maker = @serialize_manufacturers.serialize_makers_for_cars
  #   @category = category
  # end

  # def serialize_car_cat_maker
  #   serialize.merge!({
  #                      manufacturer: @serialized_maker,
  #                      category: @category
  #                    })
  # end

  # def serialize
  #   serialize_each_car
  # end

  # def serialize_car_for_show
  #   serialize_show.merge!({
  #                           manufacturer: @serialized_maker,
  #                           category: @category
  #                         })
  # end

  # private

  # def cars_key
  #   feed? ? :cars : :car
  # end

  # def serialize_each_car
  #   if feed?
  #     @cars.map { |car| serialize_cars(car) }
  #   else
  #     serialize_cars(@cars)
  #   end
  # end

  # def serialize_show
  #   if feed?
  #     @cars.map { |car| serialize_for_show(car) }
  #   else
  #     serialize_for_show(@cars)
  #   end
  # end

  # def feed?
  #   @cars.is_a?(ActiveRecord::AssociationRelation)
  # end

  # def serialize_for_show(car)
  #   {
  #     id: car.id,
  #     manufacturer_id: car.manufacturer_id,
  #     category_id: car.category_id,
  #     model: car.model,
  #     status: car.status,
  #     price: car.price,
  #     color: car.color,
  #     year: car.year,
  #     description: car.description,
  #     image_url: car.image_url
  #   }
  # end

  # def serialize_cars(car)
  #   {
  #     id: car.id,
  #     manufacturer_id: car.manufacturer_id,
  #     category_id: car.category_id,
  #     model: car.model,
  #     status: car.status,
  #     price: car.price,
  #     image_url: car.image_url
  #   }
  # end
end
