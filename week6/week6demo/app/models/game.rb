# frozen_string_literal: true

class Game < ApplicationRecord
  has_and_belongs_to_many :genres
  has_one_attached :thumbnail
end
