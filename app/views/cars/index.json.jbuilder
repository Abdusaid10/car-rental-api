json.array! @cars do |car|
  json.(car, :id, :manufacturer_id, :category_id, :model, :status, :price)
  maker = {
    manufacturer: {
      id: car.manufacturer_id,
      manufacturer: 
    }
  }
  json.image_url car.image_url
end