# frozen_string_literal: true

class MenuController < ApplicationController
  def index
    @products = Product.all
    # From application helper
    @order_item = current_order.order_items.new
  end
end
