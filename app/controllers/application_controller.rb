class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :authenticate_user!, only: [:/]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :first_name, :family_name, :first_name_kana, :family_name_kana, :birth_year, :birth_month, :birth_day])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials.basic[:user_name] && password == Rails.application.credentials.basic[:password]
    end
  end
end
