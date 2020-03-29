# frozen_string_literal: true

class MenuController < ApplicationController
  def index
    @page = 'menu'
    @cats = Category.all.where(display: true)
    @products = Product.all
  end

  def search
    @cats = Category.all.where(display: true)
    query = params[:search]
    # Could also do this in product.rb
    # def search(query) ... end
    # Then you could call product.search and pass in your query.
    results = Product.where('name LIKE ?', "%#{query}%")
    if params[:filter] == 'Select Filter'
      @products = results
    else
      symbol = params[:filter].gsub(/ /, '_').downcase!.to_sym
      @products = results.where(symbol => true)
    end
  end
end
