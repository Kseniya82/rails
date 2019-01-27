class ApplicationController < ActionController::Base

  before_action :configure_sign_up_params, only: [:create], if: :devise_controller?

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : root_path
  end

  private

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end
