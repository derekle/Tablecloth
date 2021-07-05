class UsersController < ApplicationController
    before_action :require_login,  only: [:edit, :show, :employees, :update, :destroy]
    skip_before_action :verify_authenticity_token, :only => [:index, :new, :show, :create]

    include UsersHelper
    def new
        @user = User.new
    end

    def index
        render :index
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            if !logged_in?
                session[:user_id] = @user.id
            end
            redirect_to signin_path
        else
            render :new
        end
    end 

    def edit
        @id = params[:id]
    end

    def show
        @id = params[:id]
    end

    def employees
        @user = User.new
        render :employees
    end

    def update
        if !user_params[:username].empty?
			edit_user(params[:id]).update!(username:user_params[:username])
        end
        if !user_params[:password].empty?
            edit_user(params[:id]).update!(password:user_params[:password])
        end
        if !user_params[:email].empty?
            edit_user(params[:id]).update!(email:user_params[:email])
        end
        if !user_params[:employee_type].empty?
            edit_user(params[:id]).update!(employee_type:user_params[:employee_type])
        end
        redirect_to home_path
    end

    def destroy
    end

    private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :employee_type).to_h
    end

end




