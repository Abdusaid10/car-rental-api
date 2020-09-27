class CarSerializer
  # attributes :id, :model, :status, :price, :image, :description, :color

  # belongs_to :category
  # belongs_to :manufacturer
  def initialize(cars)
    @cars = cars
    
  end

  def serialize_car_with_maker
    serialize()
  end

  def serialize
    # cars_key = get_cars_key()
    # {cars_key => serialize_each_car()}
    serialize_each_car()
  end

  private
    def get_cars_key
      is_feed?() ? :cars : :car
    end

    def serialize_each_car
      if is_feed?()
        @cars.map() { |car| serialize_cars_index(car) }
      else
        serialize_cars_show(@cars)
      end
    end

    def is_feed?
      @cars.is_a?(ActiveRecord::AssociationRelation)
    end

    def serialize_cars_show(car)
      {
        id: car.id,
        model: car.model,
        color: car.color,
        status: car.status,
        price: car.price,
        description: car.description,
        year: car.year,
        image_url: car.get_image_url(),
      }
    end

    def serialize_cars_index(car)
      {
        id: car.id,
        model: car.model,
        status: car.status,
        price: car.price,
        image_url: car.get_image_url(),
      }
    end
end