class ApplicationController < ActionController::Base
  include Authentication

  allow_browser versions: :modern # supporting webp images, web push, badges, import maps, and CSS nesting/:has

  before_action :set_current_request

  private

  def set_current_request
    Current.request = Request.new(
      uuid: request.uuid,
      path: request.path,
      method: request.method,
      ip_address: request.remote_ip,
      user_agent: request.user_agent
    )
  end
end
