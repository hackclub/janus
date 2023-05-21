class Slack
  def self.client(**options)
    @client ||= begin
      default_options = {
        identifier: ENV["SLACK_CLIENT_ID"],
        secret: ENV["SLACK_CLIENT_SECRET"],
        redirect_uri: nil, # URL helpers don't work here, so we'll set this in the controller
        host: "slack.com",
        authorization_endpoint: "/openid/connect/authorize",
        token_endpoint: "/api/openid.connect.token",
        userinfo_endpoint: "/api/openid.connect.userInfo"
      }

      OpenIDConnect::Client.new(default_options.merge(options))
    end
  end
end
