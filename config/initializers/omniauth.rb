OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :twitter, 'LkrB8lNb2WF5mT8GseiAGQ','pcGd0VKtGFInrk5z3uMYT0pNPx6RvBAtEhlPIyvWcM',{:scope =>"publish_stream,offline_access"}
 provider :facebook,'674362825929827','7cc5989b00027b86324d1268b6a4beec',{:client_options => {:ssl => {:ca_path => "/etc/ssl/  certs"}}, :scope=>"publish_stream,offline_access,read_stream,email"}
 provider :google, "841016482965-p6un6bnfpmtpaci63caqbhrj8dkct8lq.apps.googleusercontent.com", "hjgB-lzwK6a-2zdVpXyLGNSx", { access_type: "online", approval_prompt: "" }
 provider :linkedin, "6z14h4ssg9t5", "U7UhlaOvZwFULvLB", :scope => 'r_fullprofile r_emailaddress r_network', :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "location", "connections"]
end

