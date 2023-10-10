class Users::SessionsController < ApplicationController
  skip_before_action :redirect_if_unauthenticated, only: :new
  before_action :redirect_if_authenticated, only: :new

  def new
    if Rails.env.development?
      if (user = User.find_or_create_by!(email_address: params[:email]))
        cookies.encrypted[:session_token] = user.sessions.create!.token

        return redirect_to root_path
      else
        return redirect_to sign_in_path
      end
    end

    return redirect_to sign_in_path unless params[:code]

    begin
      Slack.client.authorization_code = params[:code]
      userinfo = Slack.client.access_token!.userinfo!
    rescue OpenIDConnect::Exception
      return redirect_to sign_in_path
    end

    if userinfo.raw_attributes["https://slack.com/team_id"] != "T0266FRGM" || userinfo.email_verified != true
      return redirect_to sign_in_path notice: "You're not in the Hack Club Slack and/or haven't verified your email!"
    end

    user = User.find_or_initialize_by(slack_id: userinfo.raw_attributes["https://slack.com/user_id"])
    user.name = userinfo.name if user.name.blank?
    user.email_address = userinfo.email
    user.save!

    cookies.encrypted[:session_token] = user.sessions.create!.token

    redirect_to root_path
  end

  def destroy
    Current.session.destroy!

    cookies.encrypted[:session_token] = nil

    redirect_to sign_in_path
  end
end
