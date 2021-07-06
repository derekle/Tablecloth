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
            flash[:notice] = ["User successfully created"]
            if logged_in?
                render :employees
            else
                redirect_to home_path
            end
        else
            flash[:error] = @user.get_errors
            if logged_in?
                render :employees
            else
                render :new 
            end
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
        errors = []
        @id = params[:id]
        @user = edit_user(@id)
        if !user_params[:username].empty?
			@user.update(username:user_params[:username])
        end
        if !user_params[:password].empty?
            if user_params[:password_confirmation].empty? 
                errors << "Password Confirmation cannot be blank"
            elsif user_params[:password] != user_params[:password_confirmation]
                errors << "Password and Confirmation do not match"
            else
                @user.update(password:password)
            end
        end
        if !user_params[:email].empty?
            @user.update(email:user_params[:email])
        end
        if !user_params[:employee_type].empty?
            @user.update(employee_type:user_params[:employee_type])
        end
        flash[:error] = @user.get_errors
        flash[:error] << errors
        if flash[:error].flatten!.any?
            flash[:error]
            render :edit
        else
            flash[:notice] = ["User updated sucessfully"]
            redirect_to home_path
        end
    end

    def destroy
        @id = params[:id]
        @user = edit_user(@id)
        if @user == current_user || current_user.employee_type == "manager"
            @user.destroy
            if current_user.employee_type != "manager"
                session.delete :user_id
            end
        end
        flash[:error]
        render :employees
    end

    private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :employee_type).to_h
    end

end




