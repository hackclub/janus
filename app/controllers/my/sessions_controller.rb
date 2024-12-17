class My::SessionsController < ApplicationController
  allow_unauthenticated_access only: :new
  before_action :redirect_if_authenticated, only: :new

  def new
    if params[:code].blank?
      session[:state] = SecureRandom.hex(16)
      session[:nonce] = SecureRandom.hex(16)

      @authorization_url = Slack
        .oidc_client(redirect_uri: new_my_session_url)
        .authorization_uri(
          scope: %i[email profile],
          state: session[:state],
          nonce: session[:nonce]
        )

      return render
    end

    begin
      client = Slack.oidc_client(redirect_uri: new_my_session_url)
      client.authorization_code = params[:code]
      member = client.access_token!.userinfo!
    rescue OpenIDConnect::Exception
      if Rails.env.local? then raise
      else
        return redirect_to new_my_session_path,
          notice: "Something went wrong - please try again"
      end
    end

    if member.raw_attributes["https://slack.com/team_id"] == "T0266FRGM" && member.email_verified
      User.find_or_initialize_by(slack_id: member.raw_attributes["https://slack.com/user_id"]).tap do |user|
        user.name = member.name if user.name.blank?
        user.email_address = member.email
        user.save!

        start_new_session_for user
        redirect_to root_path
      end
    else
      redirect_to new_my_session_path, notice: "You're not in the Hack Club Slack or haven't verified your email yet!"
    end
  end

  def destroy
    end_session
    redirect_to root_path
  end

  private

  def redirect_if_authenticated
    if Current.session
      redirect_back_or_to root_path, notice: "You're already logged in!"
    end
  end
end
