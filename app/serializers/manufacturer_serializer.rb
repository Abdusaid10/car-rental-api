class ManufacturerSerializer 
  
  def initialize(manufacturer)
    @manufacturer = manufacturer
  end


  def serialize
    # manufacturers_key = get_manufacturers_key()
    serialize_each_manufacturer()
    # { manufacturers_key => serialize_each_manufacturer() }
  end

  private
    # def get_manufacturers_key
    #   is_feed?() ? :manufacturers : :manufacturer
    # end

    def serialize_each_manufacturer
      if is_feed?()
        @manufacturer.map() { |manufacturer| serialize_manufacturer(manufacturer) }
      else
        serialize_manufacturer(@manufacturer)
      end
    end

    def is_feed?
      @manufacturer.is_a?(ActiveRecord::AssociationRelation)
    end

    def serialize_manufacturer(manufacturer)
      {
        id: manufacturer.id,
        about: manufacturer.about,
        image_url: manufacturer.get_image_url(),
        logo_url: manufacturer.get_logo_url(),
      }
    end
end