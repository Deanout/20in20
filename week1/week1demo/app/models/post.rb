class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :thumbnail
  has_one_attached :banner
  has_many :comments, dependent: :destroy
  has_rich_text :body
  validates :title, length: {minimum: 5}
  validates :body, length: {minimum: 25}
  self.per_page = 10
  
  def optimized_image (image, x,y)
    return image.variant(resize_to_fill: [x, y]).processed
  end
end
