module User::Guest
  extend ActiveSupport::Concern

  included do
    has_many :bookings, inverse_of: :guest, dependent: :destroy
  end
end
