class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def username
    # dean@example.com -> ['dean', 'example.com].first -> dean.capitalize -> Dean
    email.split('@')[0].capitalize
  end
end
