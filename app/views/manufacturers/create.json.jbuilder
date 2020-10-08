json.data do 
  json.manufacturer do
    json.call(
      @manufacturer,
      :manufacturer,
      :about,
      :image_url,
      :logo_url,
    )