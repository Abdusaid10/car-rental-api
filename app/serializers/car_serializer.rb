class CarSerializer

  def initialize(cars, manufacturer, category)
    @cars = cars
    @serializeManufacturers = ManufacturerSerializer.new(manufacturer)
    @serializedMaker = @serializeManufacturers.serialize_makers_for_cars()
    @category = category
  end

  def serialize_car_cat_maker
    serialize().merge!({
      manufacturer: @serializedMaker,
      category: @category
    })
  end

  def serialize
    serialize_each_car()
  end

  def serialize_car_for_show
    serialize_show().merge!({
      manufacturer: @serializedMaker,
      category: @category
    })
  end

  private
    def get_cars_key
      is_feed?() ? :cars : :car
    end

    def serialize_each_car
      if is_feed?()
        @cars.map() { |car| serialize_cars(car) }
      else
        serialize_cars(@cars)
      end
    end

    def serialize_show
      if is_feed?()
        @cars.map() { |car| serialize_for_show(car) }
      else
        serialize_for_show(@cars)
      end
    end

    def is_feed?
      @cars.is_a?(ActiveRecord::AssociationRelation)
    end

    def serialize_for_show(car)
      {
        id: car.id,
        manufacturer_id: car.manufacturer_id,
        category_id: car.category_id,
        model: car.model,
        status: car.status,
        price: car.price,
        color: car.color,
        year: car.year,
        description: car.description,
        image_url: car.get_image_url(),
      }
    end

    def serialize_cars(car)
      {
        id: car.id,
        manufacturer_id: car.manufacturer_id,
        category_id: car.category_id,
        model: car.model,
        status: car.status,
        price: car.price,
        image_url: car.get_image_url(),
      }
    end
end