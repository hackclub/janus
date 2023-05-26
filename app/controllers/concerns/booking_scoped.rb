module BookingScoped
  extend ActiveSupport::Concern

  included do
    before_action :set_booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
