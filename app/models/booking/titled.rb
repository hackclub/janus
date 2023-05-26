module Booking::Titled
  def title
    "#{type} for #{arrival_date} to #{departure_date}"
  end

  private

  def type
    if approved? || cancelled?
      "Booking"
    else
      "Booking Request"
    end
  end

  def arrival_date
    arrival_at.strftime("%B %d")
  end

  def departure_date
    departure_at.strftime("%B %d, %Y")
  end
end
