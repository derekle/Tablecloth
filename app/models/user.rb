class User < ApplicationRecord
    has_and_belongs_to_many :restaurants
    has_many :tables, through: :restaurants
    has_many :orders
    has_secure_password
end
