class Snippet < ApplicationRecord
  has_many :taggables, dependent: :destroy
  has_many :tags, through: :taggables
  belongs_to :language

  # first, second, Hello World
  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  # ['first', 'second', 'third', 'Hello World']
  # snippet # 1 has the following tags:
  # first, second, third, Hello World
  def all_tags
    tags.map(&:name).join(', ')
  end
end
