class ApplicationController < ActionController::Base
  layout "site_layout"
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resorce)
    projects_path
  end
  def after_sign_out_path_for(resorce)
    site_index_path
  end
  def after_update_path_for(resource)
    projects_path
  end

  protected

  def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

       devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
  end
end
