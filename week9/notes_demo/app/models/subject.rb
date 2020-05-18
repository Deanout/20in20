# frozen_string_literal: true

class Subject < ApplicationRecord
  has_many :notes
end
