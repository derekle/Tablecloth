class User < ApplicationRecord
    has_many :tables
    has_many :orders, through: :tables
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :email, presence: true, uniqueness: true
end
