class Menuitem < ApplicationRecord
    belongs_to :orders
    validates: name, presence: true
end
