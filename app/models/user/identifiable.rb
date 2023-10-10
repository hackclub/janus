module User::Identifiable
  extend ActiveSupport::Concern

  included do
    validates :slack_id, uniqueness: true

    validates :name, presence: true

    before_validation :default_name_to_email_address, on: :create
  end

  private

  def default_name_to_email_address
    self.name = email_address if name.blank?
  end
end
