class TablesController < ApplicationController
    before_action :require_login
    before_action :require_admin, only:[:new, :create, :update, :edit,:destroy]
    include TablesHelper
    def new
        @table = Table.new
    end

    def index
        render :index
    end

    def create
        @table = Table.new(table_params)
        binding.pry
        if @table.valid?
            @table.save
            render :index
        else
            render :new
        end
    end

    def edit
        @table = edit_table(params[:id])
    end

    def show
        set_id
    end

    def update
        binding.pry
        edit_table(params[:id]).update!(table_params)
        if table_params[:status].to_i == 1
            edit_table(params[:id]).orders.first.destroy
        end
        render :index
    end

    def stageup
        if table_params[:status] == 2
            Order.create!(table_id:params[:id], user_id:table_params[:user_ids])
        end
        edit_table(params[:id]).update!(table_params)
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


    def table_params
        params.require(:table).permit(:name, :status, :user_ids)
    end

    def set_id
        @id = params[:id]
    end
end
