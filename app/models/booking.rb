class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  # validate :valid_date?
end
