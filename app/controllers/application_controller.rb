class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :root_path
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :set_user, unless: :new_user_session_path

  def set_user
    unless current_user
      flash[:alert] = "Inicia sesión primero."
      redirect_to new_user_session_path 
    end
  end

  def after_sign_in_path_for(_resource)
    user_path(current_user)
  end

  protected 

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:full_name, :image, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:full_name, :image, :email, :password, :current_password) }
  end
end
