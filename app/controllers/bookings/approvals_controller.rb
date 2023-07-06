class Bookings::ApprovalsController < ApplicationController
  include BookingScoped

  def create
    if Current.user.staff?
      @booking.approve
      redirect_to @booking
    end
  end
end
