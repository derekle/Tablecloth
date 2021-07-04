class Order < ApplicationRecord
    belongs_to :table
    belongs_to :user
    serialize :menuitems, Array
    attribute :ispaid, :boolean, default: false
    attribute :total, :float, default: 0.00

    scope :active_order, ->{ where("ispaid = false")}

    def calculate(menuitem, quantity)
        charge = menuitem.price * quantity
        if self.total == nil
            self.total = 0.00
        end
        self.total += charge
        self.save!
    end

    def track(menuitem, quantity)
        if self.menuitems.find{|x| x[0] == menuitem} == nil
            add_to_order_array(menuitem, quantity)
        else
            update_order_entry(menuitem, quantity)
        end
    end

    def pay(quantity)
        total = self.total -= quantity
        if self.total <= 0
            self.ispaid = true
        end
        self.save!
        return total
    end

    def change(quantity)
        change = self.total - quantity
        return change
    end

    def update_order_entry(menuitem, quantity)
        self.menuitems.find{|x| x[0] == menuitem}[1]+=quantity
        self.save!
    end

    def add_to_order_array(menuitem, quantity)
        a = []
        a << menuitem
        a << quantity
        self.menuitems << a
        self.save!
    end
end
