module UsersHelper
    def logged_in?
        !!session[:user_id]
    end

    def reset
        if !User.find_by_id(session[:user_id])
            session.destroy
        end
    end

    def edit_user(userid)
        if logged_in?
            edit_user = User.find_by_id(userid)
            return edit_user
        else
            return false
        end
    end
    def current_user
        reset
        if logged_in?
            current_user = User.find_by_id(session[:user_id])
            return current_user
        end
    end
end
