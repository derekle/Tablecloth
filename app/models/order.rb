class Order < ApplicationRecord
    belongs_to :table
    belongs_to :user
    has_many :menuitems
end
