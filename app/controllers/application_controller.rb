class ApplicationController < ActionController::Base
    add_flash_types :info, :error, :warning

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def require_login
        unless logged_in?
          flash[:error] = ["You must be logged in to access this section"]
          redirect_to login_path
        end
    end
    def require_admin
        unless current_user.employee_type == "manager"
            flash[:error] = ["You must be a manager to access this section"]
          redirect_to home_path
        end
    end
    
end
