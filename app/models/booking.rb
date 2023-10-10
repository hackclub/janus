class Booking < ApplicationRecord
  include Chronological
  include Commentable
  include Eventable
  include Status

  include Available # depends on Status
  include Involving # depends on Eventable
  include Justified # depends on Eventable and Status
  include Reviewable # depends on Eventable and Status
  include Timelined # depends on Eventable
  include Titled # depends on Status

  belongs_to :creator, class_name: "User", default: -> { Current.user }
end
