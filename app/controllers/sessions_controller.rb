class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    session[:user_token] = env["omniauth.auth"]["credentials"].token
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = session[:user_token] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
