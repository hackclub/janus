class Bookings::TimelinesController < ApplicationController
  include BookingScoped

  def show
    @events = @booking.timelinable_events
  end
end
