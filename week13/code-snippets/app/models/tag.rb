class Tag < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :snippets, through: :taggables
end
