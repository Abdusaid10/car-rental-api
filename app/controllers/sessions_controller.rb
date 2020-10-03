class SessionsController < ApplicationController
  def create
    @user = User.find_by(email: session_params[:email])
  
    if @user && @user.authenticate(session_params[:password])
      login!
      render json: {
        logged_in: true,
        message: 'logged in bla',
        user: @user
      }
    else
      render json: { 
        status: 401,
        errors: ['no such user', 'verify credentials and try again or signup']
      }
    end
  end

  def is_logged_in?
    if logged_in? && current_user
      puts "session current user #{current_user}"
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      puts "session not logged in"
      render json: {
        logged_in: false,
        message: 'not logged in'
      }
    end
  end

  def destroy
    logout!
    render json: {
      status: 200,
      logged_out: true
    }
  end

  private
  def session_params
    params.require(:user).permit(:username, :email, :password)
  end
end
