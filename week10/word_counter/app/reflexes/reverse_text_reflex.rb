# frozen_string_literal: true

class ReverseTextReflex < ApplicationReflex
  def perform
    @value = element[:value].reverse
  end
end
