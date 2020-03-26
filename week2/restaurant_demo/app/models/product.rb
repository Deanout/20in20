# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :order_items
end
