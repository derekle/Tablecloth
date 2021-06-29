class Table < ApplicationRecord
    has_many :orders
    has_many :menuitems, through: :orders
    belongs_to :users, through: :restaurants
    belongs_to :restaurants
end
