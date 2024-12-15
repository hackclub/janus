class User < ApplicationRecord
  encrypts :name

  encrypts :email_address, downcase: true, deterministic: true
  validates_format_of :email_address, with: URI::MailTo::EMAIL_REGEXP

  enum :role, %w[admin].index_by(&:itself)

  has_many :sessions, dependent: :destroy
end
