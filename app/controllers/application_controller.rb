class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :first_name, :family_kana, :first_kana, :gender_id, :age, :occupation_id, :ability, :introduction])
  end
end