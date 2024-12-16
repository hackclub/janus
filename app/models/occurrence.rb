class Occurrence < ApplicationRecord
  delegated_type :occurable, types: %w[Booking], dependent: :destroy

  scope :publicly_visible, -> {
    joins("LEFT JOIN bookings ON occurrences.occurable_type = 'Booking' AND bookings.id = occurrences.occurable_id")
      .where("occurable_type IS NOT 'Booking'").or where("bookings.status = 'approved'")
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
