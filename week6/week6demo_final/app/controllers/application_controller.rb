# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_featured
  helper_method :is_admin!

  def set_featured
    @featured = Genre.where(feature_in_navbar: true).order('name ASC')
  end

  private

  def is_admin!
    redirect_to root_path unless current_user&.admin
  end
end
