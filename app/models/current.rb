class Current < ActiveSupport::CurrentAttributes
  attribute :request, :user, :session

  def session=(session)
    super
    self.user = session&.user
  end
end
