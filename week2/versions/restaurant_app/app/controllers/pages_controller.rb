# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @page = 'home'
  end

  def menu
    @page = 'menu'
    @items = Item.all
  end

  def catering
    @page = 'catering'
  end

  def info
    @page = 'info'
  end

  def reviews
    @page = 'reviews'
  end
end
