OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :twitter, 'LkrB8lNb2WF5mT8GseiAGQ','pcGd0VKtGFInrk5z3uMYT0pNPx6RvBAtEhlPIyvWcM',{:scope =>"publish_stream,offline_access"}
 provider :facebook,'1453221878237998','bb4950436c1c803d5e776fc536c20ab1',{:client_options => {:ssl => {:ca_path => "/etc/ssl/  certs"}}, :scope=>"publish_stream,offline_access,read_stream,email"}
 provider :google, "647395037207.apps.googleusercontent.com", "KEHOqQ4tAx6jwRjXmUkTdvR3", { access_type: "offline", approval_prompt: "" }
 provider :linkedin, "6z14h4ssg9t5", "U7UhlaOvZwFULvLB", :scope => 'r_fullprofile r_emailaddress r_network', :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "location", "connections"]
end

