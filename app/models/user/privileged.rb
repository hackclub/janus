module User::Privileged
  extend ActiveSupport::Concern

  included do
    enum role: {staff: 100}
  end

  def promote_to_staff
    update!(role: :staff)
  end

  def demote_from_staff
    update!(role: nil)
  end
end
