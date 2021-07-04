class OrdersController < ApplicationController
    def edit
        get_order
        render :edit
    end

    def update
        menuitem = Menuitem.find_by_id(order_params[:menuitems_id])
        quantity = order_params[:quantity].to_i
        get_order.calculate(menuitem, quantity)
        get_order.track(menuitem, quantity)
        render :edit
    end

    def show
        get_order
        @total = get_order.total
    end

    def pay
        
        @tendered = order_params[:quantity].to_f
        @change = get_order.change(@tendered)
        @total = get_order.pay(@tendered)

        if get_order.ispaid == true
            @total = 0
        end
        render :show
    end

    private
    def order_params
        params.require(:order).permit(:total, :ispaid, :menuitems_id, :quantity).to_h
    end

    def get_order
        @order = Order.find_by_id(params[:id])
    end
end
