
class ApplicationController < ActionController::Base
  protect_from_forgery
private

def current_user
	if session["warden.user.user.key"].nil?
       @current_user =nil
    else
      @current_user = session["warden.user.user.key"][1][0]
      current_user = User.find(session["warden.user.user.key"][1][0])
    end

 # @current_user ||= User.find(session[:user_id]) if session[:user_id]
end
helper_method :current_user
end
