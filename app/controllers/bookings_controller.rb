class BookingsController << ApplicationController
  
  def index
    # @bookings = current_user.bookings
    @bookings = Booking.all.where(user_id: current_user.id)
    json_response(@bookings)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = current_user.bookings.new(booking_params)

    if @booking.save!
      response = { message: Message.booking_created }
      json_response(response, :created)
    else
      response = { message: Message.something_went_wrong }
      json_response(response, :unprocessable_entity)
    end
  end

  private

  def booking_params
    params.permit(:start_date, :end_date)
  end
end