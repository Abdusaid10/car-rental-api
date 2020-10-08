json.array! @manufacturers do |manufacturer|
  json.(manufacturer, :id, :manufacturer, :about)

  json.image_url manufacturer.image_url
  json.logo_url manufacturer.logo_url
end