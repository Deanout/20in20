# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @page = 'home'
  end

  def catering
    @page = 'catering'
  end

  def info
    @page = 'info'
  end
end
