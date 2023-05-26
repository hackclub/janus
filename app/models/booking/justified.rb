module Booking::Justified
  extend ActiveSupport::Concern

  included do
    has_rich_text :justification
    validates :justification, presence: true

    belongs_to :reviewer, class_name: "User", optional: true
    scope :reviewed_by, ->(user) { where(reviewer: user) }
  end

  def reviewed?
    approved? || denied? || cancelled?
  end

  def reviewable?(by: nil)
    if by
      by.staff? && reviewable?
    else
      status.nil? || pending?
    end
  end

  def approve
    transaction do
      update!(status: :approved)
      record(:approved)
    end
  end

  def deny
    transaction do
      update!(status: :denied)
      record(:denied)
    end
  end

  def hold
    transaction do
      update!(status: :pending)
      record(:held)
    end
  end
end
