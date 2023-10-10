module Booking::Timelined
  def timelinable_events
    (visible_events + comment_events).sort_by(&:created_at)
  end

  private

  def visible_events
    events.select do |event|
      event.action.in?(TIMELINED_ACTIONS)
    end
  end

  def comment_events
    comments.includes(:events).flat_map(&:events)
  end

  TIMELINED_ACTIONS = %w[added removed held accepted rejected cancelled]
end
