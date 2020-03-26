# frozen_string_literal: true

module ApplicationHelper
  def current_order
    # Use Find by id to avoid potential errors
    if Order.find_by_id(session[:order_id]).nil?
      Order.new
    else
      Order.find_by_id(session[:order_id])
    end
  end
end
