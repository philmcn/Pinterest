require "omnicontacts"

Rails.application.config.middleware.use OmniAuth::Builder do

 provider :google, "1016354481437-rdjteuoebhgif3sct2tk7j36nhmo2so0.apps.googleusercontent.com", "56nKfnYrCia0clU0-GJfJuFP"
end

