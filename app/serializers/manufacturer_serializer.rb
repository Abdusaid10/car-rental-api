class ManufacturerSerializer < ActiveModel:: Serializer
  # attributes :id, :manufacturer, :about, :image, :logo

  def initialize(manufacturers:)
    @manufacturers = manufacturers
  end

  def serialize_new_manufacturer
    serialized_new_manufacturer = serialize_manufacturer(@manufacturers)
    serialized_new_manufacturer.to_json()
  end

  private def serialize_manufacturer(manufacturer)
    {
      manufacturers: 
        {
          id: manufacturer.id,
          about: manufacturer.about,
          image_url: manufacturer.get_image_url(),
          logo_url: manufacturer.get_logo_url(),
        }
      
    }
  end
  # def image
  #   rails_blob_path(object.image, only_path: true) if object.image.attached?
  # end
  # has_many :cars
  # has_many :categories
end