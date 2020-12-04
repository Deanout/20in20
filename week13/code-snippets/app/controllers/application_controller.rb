class ApplicationController < ActionController::Base
  before_action :set_languages

  def set_languages
    @languages = Language.all
  end
end
