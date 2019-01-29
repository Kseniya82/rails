class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :configure_sign_up_params, only: [:create], if: :devise_controller?

  def after_sign_in_path_for(user)
    user.admin? ? admin_tests_path : root_path
  end

  def default_url_options
    { lang: (I18n.locale if I18n.locale != I18n.default_locale) }
      { lang: I18n.locale }
    else
      { lang: nil }
    end
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end

end
