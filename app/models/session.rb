class Session < ApplicationRecord
  include Recorded

  belongs_to :user

  has_secure_token
end
