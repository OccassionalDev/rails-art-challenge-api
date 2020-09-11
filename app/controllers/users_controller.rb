class UsersController < ApplicationController
    def index
        @users = User.all 
    end 

    def create 
        @user = User.new(user_params)

        if @user.save 
            set_user(@user)
            render :user 

        else 
            render_form_errors(@user.errors.full_messages)
        end 
    end 

    def show 
        @user = User.find_by(id: params[:id])

        if @user 
            render :user 
        else 
            render_page_not_found
        end 
    end 

    private 
    
    def user_params(*args)
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
