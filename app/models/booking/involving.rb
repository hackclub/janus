module Booking::Involving
  extend ActiveSupport::Concern

  included do
    has_many :involvements, class_name: "Booking::Involvement", dependent: :destroy
    has_many :guests, through: :involvements

    scope :involving, ->(users) { joins(:involvements).where(involvements: {guest: users}) }

    after_create -> { Event.suppress { involve(creator) } }
  end

  def involve(guests)
    Array(guests).each do |guest|
      transaction do
        involvements.find_or_create_by guest: guest
        record :added, guest, by: Current.user
      end
    end
  end

  def involves?(user)
    guests.include?(user)
  end

  def uninvolve(guests)
    Array(guests).each do |guest|
      transaction do
        involvements.destroy_by guest: guest
        record :removed, guest, by: Current.user
      end
    end
  end
end
