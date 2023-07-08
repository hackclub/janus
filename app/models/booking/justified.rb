module Booking::Justified
  extend ActiveSupport::Concern

  included do
    has_rich_text :justification
    validates :justification, presence: true
  end
end
