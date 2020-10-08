json.array! @manufacturers do |manufacturer|
  json.id manufacturer.id
  json.manufacturer manufacturer.manufacturer
  json.about manufacturer.about

  json.image_url manufacturer.image_url
  json.logo_url manufacturer.logo_url
end