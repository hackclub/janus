module User::Identifiable
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true
    validates :slack_id, presence: true, uniqueness: true
  end
end
