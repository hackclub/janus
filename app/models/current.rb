class Current < ActiveSupport::CurrentAttributes
  attribute :ip_address, :user_agent, :request_id

  attribute :user, :session

  def session=(session)
    super
    self.user = session.user
  end
end
