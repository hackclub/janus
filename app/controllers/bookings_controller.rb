class BookingsController < ApplicationController
  before_action :set_booking, except: [:index]

  def index
    @bookings = Current.user.bookings.chronologically
  end

  def show
  end

  def edit
  end

  def update
    @booking.update(booking_params)
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
