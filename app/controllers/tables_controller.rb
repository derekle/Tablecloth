class TablesController < ApplicationController
    before_action :require_login
    before_action :require_admin, only:[:new, :create, :update,:destroy]
    include TablesHelper
    def new
        @table = Table.new
    end

    def index
        render :index
    end

    def create
        @table = Table.new(table_params)
        if @table.valid?
            @table.save
            render :index
        else
            render :new
        end
    end

    def edit
        @table = get_table
    end

    def show
        set_id
    end

    def update
        get_table.update!(table_params)

        render :index
    end

    def stageup
        if table_params[:status].to_i == 1
            get_table.orders.last.destroy
        end
        if table_params[:status] == 2
            Order.create!(table_id:params[:id], user_id:table_params[:user_ids])
        end
        if table_params[:status] == 3
            get_table.orders.where("ispaid = false").first.ispaid = true
        end
        get_table.update!(table_params)
        set_id
        render :show
    end

    def destroy
        if current_user.employee_type == "manager"
            edit_table(params[:id]).destroy
        end
        render :index
    end

    private

    def get_table
        edit_table(params[:id])
    end

    def table_params
        params.require(:table).permit(:name, :status, :user_ids)
    end

    def set_id
        @id = params[:id]
    end
end
