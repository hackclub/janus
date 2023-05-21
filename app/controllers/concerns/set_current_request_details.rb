module SetCurrentRequestDetails
  extend ActiveSupport::Concern

  included do
    before_action do
      Current.request_id = request.uuid
      Current.ip_address = request.remote_ip
      Current.user_agent = request.user_agent
    end
  end
end
