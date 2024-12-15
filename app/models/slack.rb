module Slack
  def self.oidc_client(**options)
    OpenIDConnect::Client.new({
      identifier: Rails.application.credentials.slack!.client_id,
      secret: Rails.application.credentials.slack!.client_secret,
      host: "slack.com",
      authorization_endpoint: "/openid/connect/authorize",
      token_endpoint: "/api/openid.connect.token",
      userinfo_endpoint: "/api/openid.connect.userInfo"
    }.merge(options))
  end
end
