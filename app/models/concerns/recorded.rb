module Recorded
  extend ActiveSupport::Concern

  included do
    has_many :events, as: :subject, dependent: :destroy
    after_create -> { record :created }
  end

  def record(action, by: Current.user, **details)
    events.create! action:, creator: by, details:
  end
end
