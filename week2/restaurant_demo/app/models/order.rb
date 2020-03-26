# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items
  before_save :set_subtotal

  def subtotal
    order_items.collect { |order_item| order_item.valid? ? order_item.unit_price * order_item.quantity : 0 }.sum
  end

  private

  def set_subtotal
    self[:subtotal] = subtotal
  end
end
