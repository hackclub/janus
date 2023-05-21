class User::Session < ApplicationRecord
  belongs_to :user

  has_secure_token

  def access
    update!(last_accessed_at: Time.now, ip_address: Current.ip_address, user_agent: Current.user_agent)
    self
  end
end
