class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
    admin_tests_path if current_user.is_a?(Admin)
  end

end
