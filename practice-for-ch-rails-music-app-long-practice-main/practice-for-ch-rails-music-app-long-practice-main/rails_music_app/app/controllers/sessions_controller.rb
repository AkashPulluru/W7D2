class SessionsController < ApplicationController
    before_action require_logged_out, only: [:new, :create]
    before_action require_logged_in, only: [:destroy]

    def create 
        @user = User.find_by(params[:email],params[:password])
        if user 
            login(@user)
            redirect_to user_url
        else 
            redirect_to new_session_url
            render :new
        end 
    end 

    def new  
        user = User.new 
        render :new 
    end 

    def destroy 
        logout! 
        redirect_to new_session_url
    end 

end 