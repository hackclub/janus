class SignOutsController < ApplicationController
  def new
    Current.session.destroy!
    cookies.encrypted[:session_token] = nil
    redirect_to sign_in_path
  end
end
