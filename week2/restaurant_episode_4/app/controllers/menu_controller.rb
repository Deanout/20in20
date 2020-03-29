# frozen_string_literal: true

class MenuController < ApplicationController
  before_action :set_cats
  def index
    @page = 'menu'
    @products = Product.all
  end

  def search
    query = params[:search]
    # Could also do this in the product.rb
    # def search (query)
    #   ...
    # end
    # Then you could call Product.search and pass in your query
    results = Product.where('name LIKE ?', "%#{query}%")
    if params[:filter] == 'Select Filter'
      @products = results
    else
      # "Dairy Free" -> Needs to be converted to
      # t.boolean :dairy_free,  default: false
      # "Dairy Free".gsub(/ /, '_') = "Dairy_Free".downcase! -> "dairy_free"
      # to_sym -> :dairy_free
      symbol = params[:filter].gsub(/ /, '_').downcase!.to_sym
      @products = results.where(symbol => true)
    end
  end

  private

  def set_cats
    @cats = Category.all.where(display: true)
  end
end
