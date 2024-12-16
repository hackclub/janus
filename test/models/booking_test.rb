require "test_helper"

class BookingTest < ActiveSupport::TestCase
  setup do
    Current.user = users(:sam)
  end

  test "requesting" do
    booking = Booking.new(occurrence_attributes: {
      starts_at: 2.weeks.from_now,
      ends_at: 3.weeks.from_now
    })

    assert booking.save
    assert_equal Current.user, booking.guest
  end

  test "rejecting" do
    Current.user = users(:matt)

    booking = bookings(:pending_for_a_month_from_now)

    booking.rejected!
    assert booking.rejected?

    assert_equal Current.user, booking.events.where(action: "rejected").last&.creator
  end

  test "approving" do
    Current.user = users(:matt)

    booking = bookings(:pending_for_a_month_from_now)

    booking.approved!
    assert booking.approved?

    assert_equal Current.user, booking.events.where(action: "approved").last&.creator
  end

  test "cancelling" do
    booking = bookings(:approved_for_a_week_from_now)

    booking.cancelled!
    assert booking.cancelled?

    assert_equal Current.user, booking.events.where(action: "cancelled").last&.creator
  end
end
