class UsersController < ApplicationController
  skip_before_action :authorize_request, only: %i[create index]

  def index
    @users = User.all
    if @users
      render json: @users, each_serializer: UserSerializer
    else
      render json: {
        status: 404,
        errors: ['no users found']
      }
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user, serializer: UserDetailsSerializer
    else
      render json: {
        status: 404,
        errors: ['user not found']
      }
    end
  end

  def new; end

  def create
    user = User.create!(user_params)
    if user.save!
      auth_token = AuthenticateUser.new(user.email, user.password).call
      response = { message: Message.account_created, auth_token: auth_token, id: user.id }
      json_response(response, :created)
    else
      response = { message: Message.account_not_created }
      json_response(response, :unprocessable_entity)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
