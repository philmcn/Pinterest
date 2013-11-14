class AuthenticationsController < ApplicationController
  # GET /authentications
  # GET /authentications.json
  
 def index
    @authentications = current_user.authentications if current_user
    
  end
  
  def create

    auth = request.env["omniauth.auth"]
    if current_user
      authentication = current_user.authentications.find_by_user_and_uid(auth['user'], auth['uid'])
      # else`
      # authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])
    end
    if authentication
      flash[:notice] = "Authentication successful."
      sign_in_and_redirect(:user, authentication.user)
    else
      if !current_user
        if  auth['provider']=="twitter"
        	
          exiting_user = User.find_by_name(auth["extra"]["raw_info"]["screen_name"] )
        else
          exiting_user = User.find_by_email(auth['info']['email'])
        end
        if exiting_user
          authentication =  exiting_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
          if authentication
            check_authentication(authentication)
            sign_in_and_redirect(:user, exiting_user )
          end
        else
          user = User.new
          user.apply_omniauth(auth,true)
          if  auth['provider']=="twitter"
            user.email = ""
             user.name = auth["extra"]["raw_info"]["screen_name"] 
          end
          if user.save(:validate => false)
            flash[:notice] = "Authentication successful."
            authentication =  user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
            if authentication
              check_authentication(authentication)
              sign_in_and_redirect(:user, authentication.user)
            end
          end
        end
      else
        authentication = current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
        if authentication
          check_authentication(authentication)
          flash[:notice] = "Authentication successful."
          redirect_to authentications_url
        end
           
      end
    end
  end
  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully Disconnected."
    redirect_to authentications_url
  end
  
  def failure

    flash[:notice] = "Sorry, You din't authorize"
    redirect_to authentications_url
  end
   
  

  
  private
  
  def check_authentication(authentication)
    auth = request.env["omniauth.auth"]
    if auth['provider']=="facebook" || auth['provider']=="linkedin" || auth['provider']=="google"
     authentication.auth_token = auth["credentials"]["token"]
    else
      authentication.auth_token = nil
    end
    if auth['provider']=="linkedin" || auth['provider']=="google" || auth['provider']=="linkedin" || auth['provider']=="twitter"
    authentication.auth_secret = auth['provider']=="facebook" ? nil : auth["extra"]["access_token"].secret
    else
      authentication.auth_secret =nil
    end
    if auth['provider']=="facebook" || auth['provider']=="linkedin" || auth['provider']=="google"
     authentication.user_name = auth['info']['email'] 
    elsif  auth['provider']=="twitter"
     authentication.user_name = auth["extra"]["raw_info"]["screen_name"] 
    end
    authentication.save!
  end
end
