class ApplicationController < ActionController::Base
    helper_method :is_admin?
    helper_method :is_admin!
    private
    def is_admin?
        if current_user
            return current_user.admin
        else
            return false
        end
    end
    def is_admin!
        if current_user && current_user.admin
        else
            redirect_to root_path
        end
    end
end
