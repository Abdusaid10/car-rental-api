class BookingsController < ApplicationController
  
  def index
    # @bookings = current_user.bookings
    @bookings = Booking.all
    json_response(@bookings)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)

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
    params.require(:booking).permit(:user_id, :car_id, :start_date, :end_date)
  end
end