FactoryBot.define do
  factory :manufacturer do
    manufacturer { Faker::Vehicle.unique.modal }
    about { Faker::Lorem.sentence }
  end
end