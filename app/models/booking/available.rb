module Booking::Available
  extend ActiveSupport::Concern

  included do
    scope :on, ->(date) { approved.where("departure_at >= ? AND arrival_at <= ?", date, date) }
    scope :between, ->(start_date, end_date) { approved.where("departure_at >= ? AND arrival_at <= ?", start_date, end_date) }

    validates :arrival_at, :departure_at, presence: true

    validate on: :create do
      errors.add(:arrival_at, :unavailable) if arrival_at&.<= Date.today.end_of_day
      errors.add(:departure_at, :unavailable) if departure_at&.<= Date.today.end_of_day
    end

    validate if: -> { errors.none? && (arrival_at_changed? || departure_at_changed?) } do
      if departure_at <= arrival_at
        errors.add(:arrival_at, :invalid)
        errors.add(:departure_at, :invalid)
      elsif Booking.between(arrival_at, departure_at).exists?
        errors.add(:arrival_at, :unavailable)
        errors.add(:departure_at, :unavailable)
      end
    end
  end
end
