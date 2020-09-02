class ApplicationController < ActionController::API
    include ActionController::Cookies
    include AbstractController::Helpers
    include ActionController::RequestForgeryProtection

    before_action :set_csrf_cookie
    protect_from_forgery with: :exception

    helper_method :set_user
    helper_method :page_not_found, :action_could_not_be_performed, :render_form_errors

    def set_user(user) 
        session[:user_id] = user.id 
    end 

    def action_could_not_be_performed
        @errors = ["You cannot perform this action"]
        render "errors/errors"
    end 

    def page_not_found
        @errors = ["Page could not be found"]
        render "errors/errors"
    end 

    def render_form_errors(errors)
        @errors = errors 
        render "errors/errors"
    end

    private 

    def set_csrf_cookie
        cookies["CSRF-TOKEN"] = form_authenticity_token
    end 
end
