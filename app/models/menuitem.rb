class Menuitem < ApplicationRecord
    validates :name, uniqueness: true, presence: true
    validates :price, presence: true
    validates :item_type, presence: true
end
