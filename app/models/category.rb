class Category < ApplicationRecord
  has_many :cars
  has_many :manufacturers
end
