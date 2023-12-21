class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


  def after_sign_in_path_for(resource)
    flash[:notice] = "Welcome! You have signed up successfully."
    user_path(current_user)
  end

  def after_sign_out_path_for(resource_or_scope)
    flash[:notice] = "Signed out successfully."
    super
  end


end
