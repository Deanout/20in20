# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :is_admin!

  protected

  def configure_permitted_parameters
    added_attrs = %i[username email password password_confirmation remember_me avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def is_admin!
    if current_user&.admin
    else
      redirect_to root_path
    end
  end
end
