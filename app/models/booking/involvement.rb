class Booking::Involvement < ApplicationRecord
  belongs_to :booking
  belongs_to :guest, class_name: "User"
end
