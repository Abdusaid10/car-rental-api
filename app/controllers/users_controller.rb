class UsersController < ApplicationController
  
  def index 
    @users = User.all 
    if @users
      render json: {
        users: @users 
      }
    else
      render json: {
        status: 500,
        errors: ['no users found']
      }
    end
  end

  def show 
    @user = User.find(params[:id])
    if @user
      render json: {
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: ['user not found']
      }
    end
  end
  
  def new
  end

  def create
    @user = User.new(user_params)
    puts "before #{@user}"
    if @user.save
      login!
      render json: {
        status: :created,
        user: @user
      }
    else
      render json: {
        status: 500,
        errors: [@user.errors.full_messages, 'user create error']
      }
    end
  end

  private 

  def user_params
    params.require(:user).permit(:username, :email, :password_digest, :password_confirmation)
  end
end
