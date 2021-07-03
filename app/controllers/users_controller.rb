class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :new, :create]

    def new
        @user = User.new
    end

    def index
        if session[:id] == nil
        render :index
        end
    end

    def create
        @user = User.new(user_params)
        binding.pry
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end 

    def edit
    end

    def show
        @user = User.find(params[:id])
    end

    def update
        if !user_params[:username].empty?
			current_user.update(username:user_params[:username])
        end
        if !user_params[:password].empty?
            current_user.update(password:user_params[:password])
        end
        if !user_params[:email].empty?
            current_user.update(email:user_params[:email])
        end
        if !user_params[:employee_type].empty?
            current_user.update(employee_type:user_params[:employee_type])
        end
        render :index
    end

    def destroy
    end

    private
    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
    
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :employee_type).to_h    end
end




