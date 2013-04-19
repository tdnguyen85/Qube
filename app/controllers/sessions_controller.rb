class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to mainpage_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_path

  end
end