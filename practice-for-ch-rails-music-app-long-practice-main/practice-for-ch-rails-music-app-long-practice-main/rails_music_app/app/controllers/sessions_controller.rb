class SessionsController < ApplicationController

    def create 
        login! 
    end 

    def new  
        user = User.new 
        render :new 
    end 

    def destroy 
        if current_user
            reset_session_token
            :session_token = nil 
            logout! 
        end 

        redirect_to new_session_url
    end 
end 