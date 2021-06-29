class Menuitem < ApplicationRecord
    belongs_to :restaurant, polymorphic :true
end
