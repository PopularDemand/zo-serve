class PagesController < ApplicationController

  def home
    render json: { current_user: current_user }
  end
end
