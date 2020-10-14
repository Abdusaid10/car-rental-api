FactoryBot.define do
  factory :category do
    category { Faker::Name.unique.name }
  end
end
