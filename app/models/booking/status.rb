module Booking::Status
  extend ActiveSupport::Concern

  included do
    enum status: {pending: 0, approved: 1, denied: 2, cancelled: 3}
  end
end
