class Category < ApplicationRecord
  has_many :cars, dependent: :destroy
  has_many :manufacturers
end
