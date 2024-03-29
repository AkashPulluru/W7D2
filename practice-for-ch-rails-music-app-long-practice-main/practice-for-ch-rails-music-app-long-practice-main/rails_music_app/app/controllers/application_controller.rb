class ApplicationController < ActionController::Base
   helper_method :logged_in?, :current_user 
   
   def current_user
        @current_user = User.find_by(session: session[:session_token])
   end 

   def require_logged_in
        redirect_to new_session_url unless logged_in?
   end 

   def require_logged_out
        redirect_to users_url if logged_in?
   end 

   def login(user)
    session[:session_token] = user.reset_session_token
   end 

   def logged_in?
    !!current_user
   end 

   def logout!
    if current_user
        reset_session_token
        session[:session_token] = nil 
        @current_user = nil 
    end 
   end 



end
