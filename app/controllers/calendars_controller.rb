class CalendarsController < ApplicationController
  def show
    @cutoff_date = 1.month.from_now.end_of_month.to_date
    @bookings = Booking.between(Date.current, @cutoff_date)
  end
end
