module User::Guest
  extend ActiveSupport::Concern

  included do
    has_many :booking_involvements, class_name: "Booking::Involvement", inverse_of: :guest, dependent: :destroy
    has_many :bookings, through: :booking_involvements
  end
end
