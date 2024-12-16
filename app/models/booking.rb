class Booking < ApplicationRecord
  include Occurable
  include Recorded

  belongs_to :guest, class_name: "User", default: -> { Current.user }

  enum :status, %w[pending approved rejected cancelled].index_by(&:itself)
  after_update -> { record status }, unless: :pending?
end
