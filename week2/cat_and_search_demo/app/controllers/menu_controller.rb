# frozen_string_literal: true

class MenuController < ApplicationController
  def index
    @page = 'menu'
    @products = Product.all
  end
end
