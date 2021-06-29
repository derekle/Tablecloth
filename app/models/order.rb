class Order < ApplicationRecord
    belongs_to :users
    belongs_to :tables
    belongs_to :restaurants, through: :tables
end
