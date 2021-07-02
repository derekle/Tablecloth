module UsersHelper
    def logged_in?
        !!session[:user_id]
    end
    def current_user
       # binding.pry
        if logged_in?
            current_user = User.find(session[:user_id])
            return current_user
        else
            return false
        end
    end
end
