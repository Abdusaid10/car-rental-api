class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session # with: :exception
  include Response
  # protect_from_forgery with: :exception

  # skip_before_action :verify_authenticity_token

  helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!

  def login!
    session[:user_id] = @user.id
  end

  def logged_in?
    session[:user_id]
  end

  def current_user
    puts "current user #{@current_user}"
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorized_user?
    @user == current_user
  end

  def logout!
    session.clear
  end
end
