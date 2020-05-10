class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 validates :username, presence: true, uniqueness: { case_sensitive: false }
        validate :validate_username
        attr_writer :login

        def login
            @login || username || email
        end

        def validate_username
            errors.add(:username, :invalid) if User.where(email: username).exists?
        end

        def self.find_for_database_authentication(warden_conditions)
            conditions = warden_conditions.dup
            if login = conditions.delete(:login)
                where(conditions.to_hash).where(['lower(username) = :value OR lower(email) = :value', {value: login.downcase}]).first
            elsif conditions.key?(:username) || conditions.key?(:email)
                where(conditions.to_h).first
            end
        end
end
