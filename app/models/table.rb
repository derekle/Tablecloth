class Table < ApplicationRecord
    has_many :orders
    has_many :menuitems, through: :orders
    belongs_to :user
    validates :name, presence: true
end
