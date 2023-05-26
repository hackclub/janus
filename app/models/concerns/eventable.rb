module Eventable
  extend ActiveSupport::Concern

  included do
    has_many :events, as: :eventable, dependent: :destroy
  end

  private

  def record(action, by: Current.user)
    events.create!(action: action, creator: by)
  end
end
