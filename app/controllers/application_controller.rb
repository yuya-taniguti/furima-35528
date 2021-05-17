class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new ]
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:nickname, :last_name, :first_name, :last_name_k, :first_name_k, :birthday_year])
  end
end
