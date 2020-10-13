FactoryBot.define do
  factory :car do
    model { Faker::Vehicle.model }
    price { Faker::Number.between(from: 100, to: 10000) }
    status { 'Available' }
    color { Faker::Color.rgb_color }
    year { Faker::Vehicle.year }
    description { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 100000) }
    manufacturer_id { Faker::Number.between(from: 1, to: 100000) }
  end
end