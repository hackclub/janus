module Chronological
  extend ActiveSupport::Concern

  included do
    scope :chronologically, -> { order(created_at: :desc) }
    scope :reverse_chronologically, -> { order(created_at: :asc) }
  end
end
