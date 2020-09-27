class CarSerializer
  # attributes :id, :model, :status, :price, :image, :description, :color

  # belongs_to :category
  # belongs_to :manufacturer

  def initialize(cars)
    @cars = cars
  end

  # def serialize_car_with_maker
  #   serialize()
  # end

  def serialize
    # cars_key = get_cars_key()
    # {cars_key => serialize_each_car()}
    serialize_each_car()
  end

  def serialize_car_for_show
    serialize_show()
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