class ApplicationController < ActionController::API
  # protect_from_forgery with: :null_session # with: :exception
  include Response
  include ExceptionHandler
  # protect_from_forgery with: :exception
  before_action :authorize_request
  # skip_before_action :verify_authenticity_token

  attr_reader :current_user

  private

  def authorize_request
    @current_user = AuthorizeApiRequest.new(request.headers).call[:user]
  end
end
