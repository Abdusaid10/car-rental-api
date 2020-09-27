class ManufacturerSerializer

  def initialize(manufacturer)
    @manufacturer = manufacturer
  end

  def serialize
    serialize_each_manufacturer()
  end

  def serialize_makers_for_cars
    serialize_each_maker_car()
  end

  private
    def serialize_each_manufacturer
      if is_feed?()
        @manufacturer.map() { |manufacturer| serialize_manufacturer(manufacturer) }
      else
        serialize_manufacturer(@manufacturer)
      end
    end

    def serialize_each_maker_car
      if is_feed?()
        @manufacturer.map() { |manufacturer| serialize_for_cars(manufacturer) }
      else
        serialize_for_cars(@manufacturer)
      end
    end

    def is_feed?
      @manufacturer.is_a?(ActiveRecord::AssociationRelation)
    end

    def serialize_for_cars(manufacturer)
      {
        id: manufacturer.id,
        manufacturer: manufacturer.manufacturer,
        logo_url: manufacturer.get_logo_url(),
      }
    end

    def serialize_manufacturer(manufacturer)
      {
        id: manufacturer.id,
        manufacturer: manufacturer.manufacturer,
        about: manufacturer.about,
        image_url: manufacturer.get_image_url(),
        logo_url: manufacturer.get_logo_url(),
      }
    end
end