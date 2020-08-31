class UsersController < ApplicationController
    def index
        @users = User.all 
    end 

    private 
    
    def user_params(*args)
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
