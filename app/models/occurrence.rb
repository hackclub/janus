class Occurrence < ApplicationRecord
  delegated_type :occurable, types: %w[Booking], dependent: :destroy

  scope :publicly_visible, -> {
    joins("LEFT JOIN bookings ON occurrences.occurable_type = 'Booking' AND bookings.id = occurrences.occurable_id")
      .where("occurable_type IS NOT 'Booking'").or where("bookings.status = 'approved'")
  }

  scope :between, ->(start_time, end_time) { where "starts_at < ? AND ends_at >= ?", end_time, start_time }

  scope :on, ->(date_time_or_range) {
    if (dates = date_time_or_range).is_a? Range
      between dates.first, dates.last
    elsif (time = date_time_or_range).is_a? Time
      between time.beginning_of_day, time.end_of_day
    end
  }

  validates_presence_of :starts_at, :ends_at
  validate :starts_before_it_ends

  private

  def starts_before_it_ends
    if ends_at&.before? starts_at
      errors.add :ends_before_it_starts
    end
  end
end
