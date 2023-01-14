class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  # Configuration for adding Custom Fields to Devise
  # https://gist.github.com/withoutwax/46a05861aa4750384df971b641170407
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end
