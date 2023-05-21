class Users::SignInsController < ApplicationController
  skip_before_action :redirect_if_unauthenticated
  before_action :redirect_if_authenticated

  def new
    session[:state] = SecureRandom.hex(16)
    session[:nonce] = SecureRandom.hex(16)

    @authorization_uri = Slack.client(redirect_uri: new_session_url).authorization_uri(scope: [:email, :profile], state: session[:state], nonce: session[:nonce])
  end
end
