class Taggable < ApplicationRecord
  belongs_to :tag
  belongs_to :snippet
end
