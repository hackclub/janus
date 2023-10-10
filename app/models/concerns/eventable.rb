module Eventable
  extend ActiveSupport::Concern

  included do
    has_many :events, as: :eventable, dependent: :destroy
    after_create -> { record(:created, by: Current.user) }
  end

  private

  def record(action, target = nil, by: nil, **details)
    events.create! action: action, target: target, creator: by, details: details
  end
end
