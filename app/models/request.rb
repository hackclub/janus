class Request < ApplicationRecord
  validates_presence_of %i[uuid path method ip_address]

  has_many :events, dependent: :restrict_with_error
end
