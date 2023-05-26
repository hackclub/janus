class Bookings::RequestsController < ApplicationController
  def index
    @bookings = Current.user.bookings.where(status: [nil, :pending, :denied])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    @booking.arrival_at = @booking.arrival_at&.change(hour: 12)
    @booking.departure_at = @booking.departure_at&.change(hour: 11)

    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:arrival_at, :departure_at, :justification)
  end
end
