class MenuitemsController < ApplicationController
    before_action :require_login, :require_admin

    def new
        @menuitem = Menuitem.new
    end

    def index
        render :index
    end

    def create
        @menuitem = Menuitem.new(menuitem_params)
        if @menuitem.valid?
            @menuitem.save
            render :index
        else   
            render :new
        end
    end

    def edit
        get_item
        render :edit
    end
    
    def update
        get_item.update!(menuitem_params)
        render:index
    end

    def destroy
        get_item.destroy
        render :index
    end

    private
    def menuitem_params
        params.require(:menuitem).permit(:name, :price, :item_type).to_h
    end

    def get_item
        @menuitem = Menuitem.find_by_id(params[:id])
    end
end
