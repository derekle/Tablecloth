class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :new, :create]
    include UsersHelper
    def new
        @user = User.new
    end

    def index
        render :index
    end

    def create
        @user = User.new(user_params)
        binding.pry
        if @user.valid?
            @user.save
            if !logged_in?
                session[:user_id] = @user.id
            end
            redirect_to user_path(@user)
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




