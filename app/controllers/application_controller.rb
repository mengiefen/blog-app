class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    return unless params[:user_id]

    @current_user ||= User.find_by(id: params[:user_id])
  end
end
