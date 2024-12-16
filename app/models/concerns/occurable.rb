module Occurable
  extend ActiveSupport::Concern

  included do
    has_one :occurrence, as: :occurable, touch: true
    accepts_nested_attributes_for :occurrence, update_only: true

    scope :with_occurrence, ->(**attributes) { joins(:occurrence).where(occurrences: attributes) }
  end

  delegate :starts_at, :ends_at, to: :occurrence, allow_nil: true
end
