class ApplicationController < ActionController::Base
    def authorized(user)
        current_user.id == user.id
    end

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def require_login
        if current_user
        else
          redirect_to '/signin'
        end
    end
end
