class Table < ApplicationRecord
    has_many :orders
    has_many :users, through: :orders

    validates :name, presence: true, uniqueness: true
    attribute :status, :integer, default: 1

    
    def status_to_string
        if status == 1
            return "Ready"
        end
        if self.status == 2
            return "Occupied"
        end
        if self.status == 3
            return "Needs Cleaning"
        end
    end



    def get_options_hash(e)
        User.all.where(employee_type:e).pluck(:username, :id)
    end
end
