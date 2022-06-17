class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def verify_user?
    return true if authenticate_token

    render json: { errors: [{ detail: 'Access denied' }] }, status: 401
  end

  def authenticate_token
    User.find_by(auth_token: params[:auth_token])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name bio photo email])
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email])
  end
end
