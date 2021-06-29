class Restaurant < ApplicationRecord
    has_many :tables
    has_many :orders, through: :tables
    has_many :menuitems
    has_and_belongs_to_many :users
end
