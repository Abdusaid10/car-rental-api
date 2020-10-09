class BookingSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :car_id
  belongs_to :car
end