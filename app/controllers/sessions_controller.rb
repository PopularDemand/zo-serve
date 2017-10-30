class SessionsController < ApplicationController
  # skip_before_action :require_logged_in_user, only: [:create, :destroy]

  def create
    @user = User.find_by_username(strong_user_params[:username])
    if @user && @user.authenticate(strong_user_params[:password])
      sign_in(@user)
      redirect_to @user
    else
      render json: { error: 'unable to sign in user' }
    end
  end

  def destroy
    sign_out
    redirect_to users_path # TODO send to home page
  end

  private
    def strong_user_params
      params.require(:user).permit(:password, :username)
    end
end
