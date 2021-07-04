class Order < ApplicationRecord
    belongs_to :table
    belongs_to :user
    serialize :menuitems, Array
    attribute :ispaid, :boolean, default: false
end
