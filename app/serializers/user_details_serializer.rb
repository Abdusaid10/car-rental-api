class UserDetailsSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :bookings

  def bookings
    object.bookings.map do |b|
      {
        id: b.id,
        start_date: b.start_date,
        end_date: b.end_date,
        car: { id: b.car.id, model: b.car.model }
      }
    end
  end
end