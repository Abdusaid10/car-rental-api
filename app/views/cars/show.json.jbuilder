json.(@car, :id, :model, :color, :status, :price, :description, :year)

category = { category: { 
    id: @car_category.id,
    category: @car_category.category
  }
}
maker = { 
  manufacturer: {
    id: @car_maker.id,
    manufacturer: @car_maker.manufacturer,
    about: @car_maker.about,
    logo_url: @car_maker.logo_url,
  }
}
# json.(@car_maker, :id, :manufacturer, :about)

json.image_url @car.image_url

json.merge! maker
json.merge! category