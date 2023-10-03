class UsersController < ApplicationController

    def create 
        if current_user
            redirect_to users_url 
        else 
            login!
        end 
    end 

    def new 
        render :new
    end 

    private 

    def user_params
        params.require(:user).permit(:email,:password)
        params.require(:user).permit(:email)
    end 
end 