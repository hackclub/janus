class Booking < ApplicationRecord
  include Eventable
  include Status

  include Available # depends on Status
  include Justified # depends on Eventable and Status
  include Titled # depends on Status

  belongs_to :guest, class_name: "User", default: -> { Current.user }
end
