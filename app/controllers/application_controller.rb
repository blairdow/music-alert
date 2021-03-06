class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
#    before_filter :set_user_time_zone
    
    def authorize
      redirect_to signup_path, alert: 'You have to sign up or log in to do that!' if current_user.nil?
    end
    
    private
        helper_method :current_user
    
        def current_user
            @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
        end
#        
#        def set_user_time_zone
#            Time.zone = current_user.time_zone if current_user
#        end
#    
end
