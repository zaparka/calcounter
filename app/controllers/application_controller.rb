class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    return if current_user.present?
    redirect_to root_url
  end

  private
  
  def runkeeper_user
    @runkeeper_user ||= Runkeeper.new(session[:user_token]) if current_user
  end
  helper_method :runkeeper_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
