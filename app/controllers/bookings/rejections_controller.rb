class Bookings::RejectionsController < ApplicationController
  include BookingScoped

  def create
    if Current.user.staff?
      @booking.deny
      redirect_to @booking
    end
  end
end
