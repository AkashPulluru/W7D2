class UsersController < ApplicationController

    before_action require_logged_out, only: [:new, :create]
    before_action require_logged_in, only: [:index]

    def create 
        @user = User.new(user_params)

        if user 
            redirect_to user_url(user_params)
        else 
            user.errors.full_messages, status: 422
        end 
    end 

    def new 
        render :new
    end 

    def index 
        @users = User.all 
        render :index 
    end 

    private 

    def user_params
        params.require(:users).permit(:email, :password)
        params.require(:user).permit(:email)
    end 
end 