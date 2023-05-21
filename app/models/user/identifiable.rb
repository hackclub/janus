module User::Identifiable
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true, length: {maximum: 50}
    validates :slack_id, presence: true, uniqueness: true
  end
end
