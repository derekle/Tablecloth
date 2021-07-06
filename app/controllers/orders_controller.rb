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
        @id = get_order.table.id
        render 'tables/show'
    end

    def show
        get_order
        @total = get_order.total
    end

    def pay
        @tendered = order_params[:quantity].to_f
        @total = get_order.total
        @amountdue = get_order.pay(@tendered)
        @change = get_order.change(@tendered)

        @id = get_order.table.id


        render 'tables/show'
    end

    private
    def order_params
        params.require(:order).permit(:total, :ispaid, :menuitems_id, :quantity).to_h
    end

    def get_order
        @order = Order.where("table_id = #{params[:id]}").last
        return @order
    end
end
