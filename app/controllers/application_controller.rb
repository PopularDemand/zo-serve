class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  # before_action :require_logged_in_user

  respond_to :json

  private
  def sign_in(user)
    user.regenerate_auth_token
    cookies.permanent[:auth_token] = user[:auth_token]
    @current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:auth_token)
  end

  def require_logged_out_user
    if signed_in_user?
      render json: { error: 'user must be logged out' }
    end
  end

  def redirect_back_or_root
    redirect_back(fallback_location: root_path)
  end

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
    @current_user
  end

  def signed_in_user?
    !!current_user
  end

end
