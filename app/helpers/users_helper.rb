module UsersHelper
    def logged_in?
        !!session[:user_id]
    end
    
    def is_unique?
        User.find_by_username(params[:username]) == nil
    end

    def current_user
        User.find(session[:user_id])
    end
end
