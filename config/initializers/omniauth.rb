OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :twitter, 'LkrB8lNb2WF5mT8GseiAGQ','pcGd0VKtGFInrk5z3uMYT0pNPx6RvBAtEhlPIyvWcM',{:scope =>"publish_stream,offline_access"}
 provider :facebook,'674362825929827','6ec4eb8132b63e7096d0447bb03f7937',{:client_options => {:ssl => {:ca_path => "/etc/ssl/  certs"}}, :scope=>"publish_stream,offline_access,read_stream,email"}
 provider :google, "841016482965-ab6o1896j9725t3eu21hei90nk228qqg.apps.googleusercontent.com","bC3crZaXTejfGm3NrBFn1-eY"

 provider :linkedin, "6z14h4ssg9t5", "U7UhlaOvZwFULvLB", :scope => 'r_fullprofile r_emailaddress r_network', :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "location", "connections"]
end

