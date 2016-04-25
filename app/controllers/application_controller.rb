class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  def permission_denied
    render(:file => File.join(Rails.root, 'public/403.html'), :status => 403, :layout => false)
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:tc,:phone, :email, :password, :password_confirmation, :remember_me,) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login,:tc,:phone, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:tc,:phone, :email, :password, :password_confirmation, :current_password) }
  end
end
