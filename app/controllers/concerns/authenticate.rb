module Authenticate
  extend ActiveSupport::Concern

  included do
    before_action do
      if (session = User::Session.find_by(token: cookies.encrypted[:session_token]))
        Current.session = session.access
      end
    end

    before_action :redirect_if_unauthenticated
  end

  private

  def redirect_if_unauthenticated
    redirect_to sign_in_path unless Current.session
  end

  def redirect_if_authenticated
    redirect_to root_path if Current.session
  end
end
