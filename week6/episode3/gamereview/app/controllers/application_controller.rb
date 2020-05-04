# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_featured
  helper_method :is_admin!
  def set_featured
    # Grab genres where featured is set to true and show them alphabetically
    @featured = Genre.where(feature_in_navbar: true).order('name ASC')
  end

  def is_admin!
    unless current_user&.admin
        redirect_to root_path
    end
  end
end
