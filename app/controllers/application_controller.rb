
class ApplicationController < ActionController::Base
  protect_from_forgery
before_filter :set_cache_buster
private

def set_cache_buster
  response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
  response.headers["Pragma"] = "no-cache"
  response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
end
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
