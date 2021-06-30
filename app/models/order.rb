class Order < ApplicationRecord
    belongs_to :tables
    belongs_to :users, through: :tables
    has_many :menuitems
end
