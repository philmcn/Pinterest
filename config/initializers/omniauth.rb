OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :twitter, 'FGLxByHIhy9Q7Nmyn4hkg','W8T8lHg9Hx3j81jbzst5roTwyVVW8cDwoJThDUyz2h4',{:scope =>"publish_stream,offline_access"}
 provider :facebook,'480839148691388','a7ae12f160006a9a5192e5dc8f3d2878',{:client_options => {:ssl => {:ca_path => "/etc/ssl/  certs"}}, :scope=>"publish_stream,offline_access,read_stream,email"}
 provider :google_oauth2, '272723124014-h83bjvdfu2um3tffk97decvnmu58ss5p.apps.googleusercontent.com', 'ZvrXzrrxPvWGJFxFayrPTJbb', { access_type: "offline", approval_prompt: "true" }

 provider :linkedin, "6z14h4ssg9t5", "U7UhlaOvZwFULvLB", :scope => 'r_fullprofile r_emailaddress r_network', :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "location", "connections"]
end

