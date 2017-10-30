class UsersController < ApplicationController
  # skip_before_action :require_logged_in_user, only: [:new, :create]
  before_action :set_user, only: [:show]
  before_action :require_logged_out_user, only: [:create]

  def create
    @user = User.new(strong_user_params)
    if @user.save
      # User.send_welcome_email(@user.id)
      sign_in(@user)
      render json: { user: @user, current_user: current_user }
    else
      render json: { error: 'unable to create user' }
    end
  end

  def show
    render json: { user: @user, current_user: current_user }
  end

  def index
    users = User.all
    render json: { users: users, current_user: current_user }
  end

  private

    def strong_user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_logged_in_user
      unless signed_in_user?
        render json: { error: 'must be logged in to see this' }
      end
    end

    def require_current_user
      unless current_user.id.to_s == params[:id]
        render json: { error: 'not authorized to do that action'}
      end
    end
end
