# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments

  # dean@example.com -> self.email.split('@') -> ["dean", "example.com"] -> [0] -> "dean".capitalize -> "Dean"
  def username
    email.split('@')[0].capitalize
  end

  def comment_created
    self.number_of_comments = number_of_comments + 1
    save
    return self.number_of_comments
  end
end
