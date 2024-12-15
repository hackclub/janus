module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :require_authentication
  end

  class_methods do
    def allow_unauthenticated_access(**options)
      skip_before_action :require_authentication, **options
    end
  end

  private

  def require_authentication
    resume_session || redirect_to(new_my_session_path)
  end

  def resume_session
    Current.session ||= Session.find_by_token(cookies.signed[:session_token])
  end

  def start_new_session_for(user)
    user.sessions.create!.tap do |session|
      Current.session = session
      cookies.permanent.signed[:session_token] = {
        value: session.token,
        httponly: true,
        secure: Rails.configuration.force_ssl
      }
    end
  end

  def end_session
    Current.session.destroy!
    cookies.delete :session_token
  end
end
