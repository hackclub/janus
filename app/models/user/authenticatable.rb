module User::Authenticatable
  extend ActiveSupport::Concern

  included do
    has_many :sessions, class_name: "User::Session", dependent: :destroy
  end
end
